
#include<windows.h>
#include<stdio.h>
#include<malloc.h>
#include "bootmainall.h"
#include "chipid.h"
#include "hidusb-tool.h"

int rel_onoff(USBDEVHANDLE dev, int is_on, int relaynum);
USBDEVHANDLE openDevice(void);

#define RELAY_PWR	4 // off = 0v on = 12v
#define RELAY_KEY	3 // off = 0v on = 12v
#define RELAY_VSEL	2 // off = 12v on = 20v
#define RELAY_DATA	1 // off = data on = 12v
#define ON			1
#define OFF			0
#define BOOTSTRAP	0
#define PROGRAM		1
#define DATA		0
#define VSEL		1

char *device = 0;
HANDLE hComm = 0;
HANDLE hBuff = 0;
unsigned char *recv_buffer = 0;
unsigned char *send_buffer = 0;
unsigned char *save_buffer = 0;
char *name_buffer = 0;
COMMTIMEOUTS timeouts = { 0 };
DCB state = { 0 };
static USBDEVHANDLE dev = 0;
bool ABORT = false;


BOOL WINAPI consoleHandler(DWORD signal) {
	ABORT = true;
	if (signal == CTRL_C_EVENT) {
		if (hBuff){
			CloseHandle(hBuff);
			hBuff = 0;
		}
		if (recv_buffer){
			free(recv_buffer);
			recv_buffer = 0;
		}
		if (send_buffer){
			free(send_buffer);
			send_buffer = 0;
		}
		if (name_buffer){
			free(name_buffer);
			name_buffer = 0;
		}
		if (save_buffer) {
			free(save_buffer);
			save_buffer = 0;
		}
		if (device) {
			free(device);
			device = 0;
		}

		rel_onoff(dev, OFF, -4);
		if (dev) {
			usbhidCloseDevice(dev);
			dev = 0;
		}

		if (hComm){
			CloseHandle(hComm);
			hComm = 0;
		}
	}
	return 1;
}

int main(int argc, char *argv[])
{
	int ret = 1;
	unsigned long i = 0;
	int retry_num = 0;
	unsigned long send_num = 0;
	unsigned long recv_num = 0;
	unsigned long num = 0;
	const int max_retry = 30;
	unsigned long baud = 9600;
	DWORD dwAttrib = 0;
	// change to true to force bootstrap to send 0x0000->0xFFFF
	bool force_all = false;

	if (argc != 2 || strlen(argv[1]) > 1) {
		printf("please supply COM port number\n");
		printf("correct value is 1 through 9\n");
		return ret;
	}

	SetConsoleCtrlHandler(consoleHandler, TRUE);

	// get some memory for buffers

	recv_buffer = (unsigned char *)malloc(0x10001);
	if (!recv_buffer){
		goto EXIT;
	}
	send_buffer = (unsigned char *)malloc(0x201);
	if (!send_buffer){
		goto EXIT;
	}
	name_buffer = (char *)malloc(0x10);
	if (!name_buffer){
		goto EXIT;
	}
	save_buffer = (unsigned char *)malloc(0x10000);
	if (!save_buffer){
		goto EXIT;
	}
	device = (char *)malloc(0x20);
	if (!device) {
		goto EXIT;
	}
	//null out buffers
	memset(recv_buffer, 0x00, 0x10001);
	memset(name_buffer, 0x00, 0x10);
	memset(save_buffer, 0x00, 0x10000);

	sprintf(device, "\\\\.\\COM%s", argv[1]);

	dev = openDevice();
	if (!dev) {
		printf("Error in opening relay board\n");
		goto EXIT;
	}
	// turn all relays off
	rel_onoff(dev, OFF, -4);

	// create serial port handle

	hComm = CreateFileA(device, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);

	if (hComm == INVALID_HANDLE_VALUE) {
		printf("Error in opening COM%s\n", argv[1]);
		goto EXIT;
	}
	else {
		printf("Opening COM%s successful\n", argv[1]);
	}

	if (!GetCommState(hComm, &state)) {
		printf("failed to get COM state\n");
		goto EXIT;
	}

Start:

	// setup comport timeouts

	timeouts.ReadIntervalTimeout = 0;
	timeouts.ReadTotalTimeoutConstant = 5000;
	timeouts.ReadTotalTimeoutMultiplier = 0;
	timeouts.WriteTotalTimeoutConstant = 5000;
	timeouts.WriteTotalTimeoutMultiplier = 0;
	if (!SetCommTimeouts(hComm, &timeouts)) {
		printf("failed to set COM timeouts\n");
		goto EXIT;
	}

	// setup serial port, ECU starts start at 7812 BAUD
	// then switches to 1200 BAUD, setup for 9600 BAUD to
	// capture the BREAK the ECU sends to signal it has
	// entered bootstrap mode.

	state.DCBlength = sizeof(DCB);
	state.BaudRate = 9600;
	state.ByteSize = 8;
	state.Parity = NOPARITY;
	state.StopBits = ONESTOPBIT;
	if (!SetCommState(hComm, &state)) {
		printf("failed to set COM state\n");
		goto EXIT;
	}

	// power on ECU in bootstrap mode

	rel_onoff(dev, BOOTSTRAP, RELAY_VSEL);
	rel_onoff(dev, VSEL, RELAY_DATA);
	Sleep(10);
	rel_onoff(dev, ON, RELAY_PWR);
	rel_onoff(dev, ON, RELAY_KEY);

	Sleep(50);

	// ECU sends 0x00 when it enters bootstrap mode

	recv_buffer[0] = 0xAA;

	if (ReadFile(hComm, recv_buffer, 1, &num, NULL)) {
		if (num == 1 && recv_buffer[0] == 0x00) {
			printf("ECU sent 0x%02X\n", recv_buffer[0]);
		}
		else {
			printf("ECU not in bootstrap mode\n");
			goto EXIT;
		}
	}
	else {
		printf("ECU not in bootstrap mode\n");
		goto EXIT;
	}

	// ECU is in bootstrap mode disconnect 12 volts
	// from pin 45 and connect COM port TXD

	rel_onoff(dev, DATA, RELAY_DATA);

	// bootstrap download only seems to work at 1200 BAUD

	state.DCBlength = sizeof(DCB);
	state.BaudRate = 1200;
	state.ByteSize = 8;
	state.Parity = NOPARITY;
	state.StopBits = ONESTOPBIT;
	if (!SetCommState(hComm, &state)) {
		printf("failed to set COM state for bootstrap download\n");
		goto EXIT;
	}

	memset(send_buffer, 0x00, 0x201);
	memcpy(send_buffer, bootmainall, sizeof(bootmainall));
	memset(recv_buffer, 0x00, 0x10001);

	// set voltage select relay to 20v supplied
	// by the boost converter

	rel_onoff(dev, PROGRAM, RELAY_VSEL);

	// purge garbage from serial port buffers

	if (!FlushFileBuffers(hComm)) {
		printf("failed to flush file buffers\n");
		goto EXIT;
	}

	// need to let the data lines settle a little after power on

	Sleep(2000);

	// send bootstrap to ECU, ECU's that use the 68HC11E9
	// have variable length download, bootstrap length
	// of 257 bytes should work in all cases.

	printf("Sending bootstrap...\n");
	if (!WriteFile(hComm, send_buffer, 0x101, &send_num, NULL)) {
		printf("failed to send bootstrap\n");
		goto EXIT;
	}
	printf("%d bytes sent\n", send_num);

	// ECU echos back charaters sent, check
	// if it sent 256 bytes back, if 256 bytes
	// were not received, enter retry loop

	if (!ReadFile(hComm, recv_buffer, 0x100, &recv_num, NULL)) {
		printf("failed to read from COM port\n");
	}

	if (recv_num != 0x100) {
		printf("%d bytes received\n", recv_num);
		retry_num++;
		rel_onoff(dev, OFF, -4);
		if (retry_num >= max_retry) {
			printf("ERPOM download failed after %d attempts\n", retry_num);
			goto EXIT;
		}
		printf("retry %d\n", retry_num);
		Sleep(2000);
		goto Start;
	}

	// compare send and receive buffers, sometimes the ECU will
	// send a leading null and will cause the bootstrap corruption
	// check to fail, handle leading null and no leading null cases

	if ((memcmp(send_buffer + 1, recv_buffer, sizeof(bootmainall)) != 0) &
		(memcmp(send_buffer + 1, recv_buffer + 1, sizeof(bootmainall)) != 0)) {
		printf("bootstrap is corrupt\n");
		retry_num++;
		rel_onoff(dev, OFF, -4);
		if (retry_num >= max_retry) {
			printf("ERPOM download failed after %d attempts\n", retry_num);
			goto EXIT;
		}
		printf("retry %d\n", retry_num);
		Sleep(2000);
		goto Start;
	}

	// change comport BAUD to whatever is defined

	state.DCBlength = sizeof(DCB);
	state.BaudRate = baud;
	state.ByteSize = 8;
	state.Parity = NOPARITY;
	state.StopBits = ONESTOPBIT;
	if (!SetCommState(hComm, &state)) {
		printf("failed to set COM state\n");
		goto EXIT;
	}

	timeouts.ReadIntervalTimeout = 0;
	timeouts.ReadTotalTimeoutConstant = 500;
	timeouts.ReadTotalTimeoutMultiplier = 0;
	timeouts.WriteTotalTimeoutConstant = 500;
	timeouts.WriteTotalTimeoutMultiplier = 0;
	if (!SetCommTimeouts(hComm, &timeouts)) {
		printf("failed to set COM timeouts\n");
		goto EXIT;
	}
// at this point bootmainall is waiting for some
// code to run, interacting with the EEPROM
// requires 20v to be applied to pin 45, switch
// the voltage select relay to the 20v provided
// by the boost converter and send the code to
// identify the EEPROM.

	printf("sending chipid\n");
	if (!WriteFile(hComm, chipid, sizeof(chipid), &send_num, NULL)) {
		printf("failed to send chipid\n");
		goto EXIT;
	}

	// bootmainall doesn't echo back the header (first 3 bytes)
	// third byte of the header is the command size

	if (!ReadFile(hComm, recv_buffer, chipid[2], &recv_num, NULL)) {
		printf("failed to read from COM port\n");
	}

	printf("%d bytes sent\n%d bytes received\n", send_num, recv_num);
	
	rel_onoff(dev, VSEL, RELAY_DATA); // apply 20v to pin 45

	if (!ReadFile(hComm, recv_buffer, 2, &recv_num, NULL)) {
		printf("failed to read from COM port\n");
	}

	rel_onoff(dev, DATA, RELAY_DATA); // disconnect 20v from pin 45
	printf("chip id: %02X%02X\n", recv_buffer[0], recv_buffer[1]);

	// use chip id to lookup manufacturer and chip part number

	switch (recv_buffer[0]) {
	case 0x89:
		printf("Intel ");
		switch (recv_buffer[1]){
		case 0xB8:
			printf("P28F512 (64k)");
			break;
		case 0xB9:
			printf("P28F256 (32k)");
			break;
		}
		break;
	case 0x98:
		printf("Toshiba ");
		switch (recv_buffer[1]){
		case 0x40:
			printf("TC97208 (32k)");
			break;
		case 0x70:
			printf("TC97209 (64k)");
			break;
		}
		break;
	case 0x20:
		printf("ST ");
		switch (recv_buffer[1]){
		case 0xA8:
			printf("M28F256 (32k)");
			break;
		case 0x02:
			printf("M28F512 (64k)");
			break;
		}
		break;
	case 0x01:
		printf("AMD ");
		switch (recv_buffer[1]){
		case 0xA1:
			printf("AM28F256 (32k)");
			break;
		case 0x25:
			printf("AM28F512 (64k)");
			break;
		}
		break;
	}

	ret = 0;

EXIT:
	if (hBuff){
		CloseHandle(hBuff);
		hBuff = 0;
	}
	if (recv_buffer){
		free(recv_buffer);
		recv_buffer = 0;
	}
	if (send_buffer){
		free(send_buffer);
		send_buffer = 0;
	}
	if (name_buffer){
		free(name_buffer);
		name_buffer = 0;
	}
	if (save_buffer) {
		free(save_buffer);
		save_buffer = 0;
	}
	if (device) {
		free(device);
		device = 0;
	}
	rel_onoff(dev, OFF, -4);
	if (dev) {
		usbhidCloseDevice(dev);
		dev = 0;
	}
	if (hComm){
		CloseHandle(hComm);
		hComm = 0;
	}
	return ret;
}
