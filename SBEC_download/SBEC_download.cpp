
#include<windows.h>
#include<stdio.h>
#include<malloc.h>
#include "dump.h"
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

#define USB_RELAY_BOARD

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

#ifdef USB_RELAY_BOARD
		if (dev) {
			rel_onoff(dev, OFF, -4);
			usbhidCloseDevice(dev);
			dev = 0;
		}
#endif
		if (hComm){
#ifndef USB_RELAY_BOARD
			state.fDtrControl = 0;
			state.fRtsControl = 0;
			SetCommState(hComm, &state);
#endif
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

#ifdef USB_RELAY_BOARD
	dev = openDevice();
	if (!dev) {
		printf("Error in opening relay board\n");
		goto EXIT;
	}
	// turn all relays off
	if (dev){
		if (rel_onoff(dev, OFF, -4))
			goto EXIT;
	}
#endif

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
#ifndef USB_RELAY_BOARD
	state.fDtrControl = 1; // apply 12 volts to pin 45
	state.fRtsControl = 0; // ECU power off
#endif
	if (!SetCommState(hComm, &state)) {
		printf("failed to set COM state\n");
		goto EXIT;
	}

#ifdef USB_RELAY_BOARD
	if (dev){
		if (rel_onoff(dev, BOOTSTRAP, RELAY_VSEL))
			goto EXIT;
	}
	if (dev){
		if (rel_onoff(dev, VSEL, RELAY_DATA))
			goto EXIT;
	}
#endif

	Sleep(10);

#ifdef USB_RELAY_BOARD
	if (dev){
		if (rel_onoff(dev, ON, RELAY_PWR))
			goto EXIT;
	}
	if (dev) {
		if (rel_onoff(dev, ON, RELAY_KEY))
			goto EXIT;
	}
#else
	state.fRtsControl = 1; // ECU power on
	if (!SetCommState(hComm, &state)) {
		printf("failed to power on ECU\n");
		goto EXIT;
	}
#endif

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

#ifdef USB_RELAY_BOARD
	if (dev) {
		if (rel_onoff(dev, DATA, RELAY_DATA))
			goto EXIT;
	}
#else
	state.fDtrControl = 0; // disconnect 12 volts from pin 45
	if (!SetCommState(hComm, &state)) {
		printf("failed to disconnect power from pin 45\n");
		goto EXIT;
	}
#endif

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
	memcpy(send_buffer, dump, sizeof(dump));
	memset(recv_buffer, 0x00, 0x10001);

	// set the BAUD rate of the bootstrap

	if (baud == 1200) {
		send_buffer[8] = 0x33;
	}
	else if (baud == 9600) {
		send_buffer[8] = 0x30;
	}

	// force download 0x0000 -> 0xFFFF

	if (force_all) {
		send_buffer[40] = 0x00;
		send_buffer[45] = 0x00;
	}

	// purge garbage from serial port buffers

	if (!FlushFileBuffers(hComm)) {
		printf("failed to flush file buffers\n");
		goto EXIT;
	}


	// need to let the data lines settle a little after power on

	Sleep(2000);
	if (ABORT)
		goto EXIT;

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

	if (ABORT)
		goto EXIT;

	if (!ReadFile(hComm, recv_buffer, 0x100, &recv_num, NULL)) {
		printf("failed to read from COM port\n");
	}

	if (recv_num != 0x100) {
		printf("%d bytes received\n", recv_num);
		retry_num++;
#ifdef USB_RELAY_BOARD
		if (dev) {
			if (rel_onoff(dev, OFF, -4))
				goto EXIT;
		}
#else
		state.fDtrControl = 0; // disconnect 12 volts from pin 45
		state.fRtsControl = 0; // power ECU off
		if (!SetCommState(hComm, &state)) {
			printf("failed to set COM state\n");
			goto EXIT;
		}
#endif
		if (retry_num >= max_retry) {
			printf("ERPOM download failed after %d attempts\n", retry_num);
			goto EXIT;
		}
		printf("retry %d\n", retry_num);
		Sleep(2000);
		if (ABORT)
			goto EXIT;
		goto Start;
	}

	// compare send and receive buffers, sometimes the ECU will
	// send a leading null and will cause the bootstrap corruption
	// check to fail, handle leading null and no leading null cases

	if ((memcmp(send_buffer + 1, recv_buffer, sizeof(dump)) != 0) &
		(memcmp(send_buffer + 1, recv_buffer + 1, sizeof(dump)) != 0)) {
		printf("bootstrap is corrupt\n");
		retry_num++;
#ifdef USB_RELAY_BOARD
		if (dev) {
			if (rel_onoff(dev, OFF, -4))
				goto EXIT;
		}

#else
		state.fDtrControl = 0; // disconnect 12 volts from pin 45
		state.fRtsControl = 0; // power ECU off
		if (!SetCommState(hComm, &state)) {
			printf("failed to set COM state\n");
			goto EXIT;
		}
#endif
		if (retry_num >= max_retry) {
			printf("ERPOM download failed after %d attempts\n", retry_num);
			goto EXIT;
		}
		printf("retry %d\n", retry_num);
		Sleep(2000);
		if (ABORT)
			goto EXIT;
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

	// start capturing byte stream

	if (ABORT) {
		goto EXIT;
	}

	printf("Downloading at %d BAUD\n", baud);
	i = 0;
	send_num = 0;
	recv_num = 0;

	// bootstrap can send 0x8000 0xE000 or forced to send 0x10000, capture
	// in 64 byte chunks, check byte count when stream stops then save buffer

	while (ReadFile(hComm, &recv_buffer[i], 0x40, &num, NULL)) {
		if (ABORT) {
			printf("\n");
			goto EXIT;
		}
		i = i + num;
		recv_num = recv_num + num;
		if (num != 0x40) {
			if (recv_num == 0x8000) {
				goto Save;
			}
			else if (recv_num == 0xE000) {
				goto Save;
			}
			else if (recv_num == 0x10000) {
				goto Save;
			}
			else {
				retry_num++;
#ifdef USB_RELAY_BOARD
				if (dev) {
					if (rel_onoff(dev, OFF, -4))
						goto EXIT;
				}
#else
				state.fDtrControl = 0; // disconnect 12 volts from pin 45
				state.fRtsControl = 0; // power ECU off
				if (!SetCommState(hComm, &state)) {
					printf("failed to set COM state\n");
					goto EXIT;
				}
#endif
				if (retry_num >= max_retry) {
					printf("\nERPOM download failed after %d attempts\n", retry_num);
					goto EXIT;
				}

				// seems like we are losing some data 1200 BAUD usualy works

				if (baud != 1200) {
					baud = 1200;
				}
				printf("retry %d\n", retry_num);
				Sleep(2000);
				if (ABORT)
					goto EXIT;
				goto Start;
			}
		}
		printf("\r");
		printf("0x%02X bytes received", recv_num);
	}
Save:
	printf("\n");
	// use ECU part number for filename

	if (recv_num == 0x10000) {
		sprintf(name_buffer, "dump_all.bin");
	}
	else {
		sprintf(name_buffer, "%02X%02X%02X%02X.bin", recv_buffer[2], recv_buffer[3], recv_buffer[4], recv_buffer[5]);
	}

	// special handeling for 64k EPROM's

	if (recv_num == 0xE000) {

		// copy 64k EPROM to new buffer starting at offset 0x2000

		for (i = 0; i < recv_num; i++) {
			save_buffer[0x2000 + i] = recv_buffer[i];
		}

		// clear 68HC11 EEPROM

		for (i = 0xB600; i < 0xB800; i++) {
			save_buffer[i] = (unsigned char)0xFF;
		}
		recv_num = 0x10000;
		memcpy(recv_buffer, save_buffer, recv_num);
	}
	else if (recv_num == 0x8000) {

		// clear 68HC11 EEPROM

		for (i = 0x3600; i < 0x3800; i++) {
			recv_buffer[i] = (unsigned char)0xFF;
		}
	}

	// save EPROM image to file

	// check if file already exists, allow up to 99 duplicate files

	dwAttrib = GetFileAttributes(name_buffer);
	if (dwAttrib != 0xFFFFFFFF && !(dwAttrib & FILE_ATTRIBUTE_DIRECTORY)) {
		for (i = 1; i < 100; i++) {
			if (recv_num == 0x10000) {
				sprintf(name_buffer, "dump_all (%d).bin", i);
			}
			else {
				sprintf(name_buffer, "%02X%02X%02X%02X (%d).bin", recv_buffer[2], recv_buffer[3], recv_buffer[4], recv_buffer[5], i);
			}
			dwAttrib = GetFileAttributes(name_buffer);
			if (dwAttrib == 0xFFFFFFFF && (dwAttrib & FILE_ATTRIBUTE_DIRECTORY)) {
				goto SAVE_FILE;
			}
		}
		printf("file exists");
		goto EXIT;
	}


SAVE_FILE:
	hBuff = CreateFile(name_buffer, GENERIC_READ | GENERIC_WRITE, 0, NULL, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, NULL);

	if (hBuff == INVALID_HANDLE_VALUE) {
		printf("failed to create EPROM file\n");
		goto EXIT;
	}

	if (!WriteFile(hBuff, recv_buffer, recv_num, &num, NULL)) {
		printf("failed to write EPROM to file\n");
		goto EXIT;
	}

	if (!CloseHandle(hBuff)) {
		printf("failed to close file handle\n");
		goto EXIT;
	}

	printf("EPROM saved to %s", name_buffer);
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
#ifdef USB_RELAY_BOARD
	if (dev) {
		rel_onoff(dev, OFF, -4);
		usbhidCloseDevice(dev);
		dev = 0;
	}
#endif
	if (hComm){
#ifndef USB_RELAY_BOARD
		state.fDtrControl = 0;
		state.fRtsControl = 0;
		SetCommState(hComm, &state);
#endif
		CloseHandle(hComm);
		hComm = 0;
	}
	return ret;
}

