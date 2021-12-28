// SBEC_eeflash.cpp : Defines the entry point for the console application.
//
#include<windows.h>
#include<stdio.h>
#include<malloc.h>
#include "eeflash.h"
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
unsigned char *file_buffer = 0;
char *name_buffer = 0;
COMMTIMEOUTS timeouts = { 0 };
DCB state = { 0 };
static USBDEVHANDLE dev = 0;
BOOL ABORT = FALSE;

void usage() {
	printf("\nSBEC_eeflash /C:[1-9] /F:[filename]\n");
	printf("\n/C:[1-9] COM port 1 to 9\n");
	printf("/F:[filename] 512 byte eeprom file\n");
	return;
}

BOOL WINAPI consoleHandler(DWORD signal) {
	ABORT = TRUE;
	if (signal == CTRL_C_EVENT) {
		if (hBuff){
			CloseHandle(hBuff);
			hBuff = 0;
		}
		if (recv_buffer){
			free(recv_buffer);
			recv_buffer = 0;
		}
		if (file_buffer){
			free(file_buffer);
			file_buffer = 0;
		}
		if (name_buffer){
			free(name_buffer);
			name_buffer = 0;
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
	int retry_num = 0;
	unsigned long send_num = 0;
	unsigned long recv_num = 0;
	unsigned long num = 0;
	const int max_retry = 30;
	unsigned long baud = 9600;
	DWORD dwAttrib = 0;
	char com[] = "0\0\0\0";
	BOOL clear_codes = FALSE;

	if (argc < 3){
		usage();
		return ret;
	}

	for (int i = 1; i < argc; i++)
	{
		if (argv[i][0] == '/')
		{

			if (argv[i][1] == 'c' ||
				argv[i][1] == 'C')
			{
				if (argv[i][2] == ':')
				{
					if (strlen(argv[i]) != 4) {
						printf("Incorrect argument\nCorrect value is a number 1-9\nExample: /C:5");
						return ret;
					}
					if (argv[i][3] < '1' || argv[i][3] > '9') {
						printf("Please supply a valid COM port number\n");
						printf("Correct value is a number 1-9\n");
						return ret;
					}
					com[0] = argv[i][3];
				}

			}
			if (argv[i][1] == 'f' ||
				argv[i][1] == 'F')
			{
				if (argv[i][2] == ':')
				{
					hBuff = CreateFileA(&argv[i][3], GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
					if (hBuff == INVALID_HANDLE_VALUE)
					{
						printf("Can't open file %s\n", &argv[i][3]);
						return ret;
					}
					if (GetFileSize(hBuff, NULL) != 0x200){
						printf("Wrong file size\n");
						return ret;
					}
				}
			}
			if (argv[i][1] == 'e' ||
				argv[i][1] == 'E')
			{
				clear_codes = TRUE;
			}
		}
	}

	SetConsoleCtrlHandler(consoleHandler, TRUE);

	// get some memory for buffers

	recv_buffer = (unsigned char *)malloc(0x800);
	if (!recv_buffer){
		goto EXIT;
	}
	file_buffer = (unsigned char *)malloc(0x800);
	if (!file_buffer){
		goto EXIT;
	}
	name_buffer = (char *)malloc(0x40);
	if (!name_buffer){
		goto EXIT;
	}
	device = (char *)malloc(0x20);
	if (!device) {
		goto EXIT;
	}


	//null out buffers
	memset(recv_buffer, 0x00, 0x800);
	memset(file_buffer, 0x00, 0x800);
	memset(name_buffer, 0x00, 0x40);

	sprintf(device, "\\\\.\\COM%s", com);
	if (!ReadFile(hBuff, file_buffer, 0x200, &num, NULL)){
		printf("Read of eeprom file failed\n");
		goto EXIT;
	}

	if (clear_codes) {
		memset(&file_buffer[20], 0xFF, 0x40);
	}

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
		printf("Error in opening COM%s\n", com);
		goto EXIT;
	}
	else {
		printf("Opening COM%s successful\n", com);
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

	Sleep(100);

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

	Sleep(100);

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
	if (dev){
		if (rel_onoff(dev, PROGRAM, RELAY_VSEL))
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
		printf("failed to set COM state for EEPROM flash\n");
		goto EXIT;
	}

	memset(recv_buffer, 0x00, 0x800);

	// set the BAUD rate of the bootstrap

	if (baud == 1200) {
		eeflash[8] = 0x33;
	}
	else if (baud == 9600) {
		eeflash[8] = 0x30;
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

	printf("Sending EEPROM flash\n");
	if (!WriteFile(hComm, eeflash, sizeof(eeflash), &send_num, NULL)) {
		printf("failed to send EEPROM flash\n");
		goto EXIT;
	}
	printf("0x%02X bytes sent\n", send_num);

	// ECU echos back characters sent, check
	// if it sent 256 bytes back, if 256 bytes
	// were not received, enter retry loop

	if (ABORT)
		goto EXIT;

	if (!ReadFile(hComm, recv_buffer, 0x100, &recv_num, NULL)) {
		printf("failed to read from COM port\n");
	}

	if (recv_num != 0x100) {
		printf("0x%02X bytes received\n", recv_num);
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
			printf("EEPROM flash failed after %d attempts\n", retry_num);
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

	if ((memcmp(eeflash + 1, recv_buffer, 0xA0) != 0) &
		(memcmp(eeflash + 1, recv_buffer + 1, 0xA0) != 0)) {
		printf("EEPROM flash is corrupt\n");
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
			printf("EEPROM flash failed after %d attempts\n", retry_num);
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

	if (ABORT) {
		goto EXIT;
	}
	
	Sleep(500); // 68hc11e9 ECU's need this
	
	printf("Uploading at %d BAUD\n", baud);
	num = 0;
	for (int i = 0; i < 8; i++){
		if (!WriteFile(hComm, file_buffer+num, 0x40, &send_num, NULL)) {
			printf("failed to send data\n");
			goto EXIT;
		}
		num = num + send_num;
		printf("\r");
		printf("0x%02X bytes sent", num);
		Sleep(650);
	}
	printf("\n");
	printf("Downloading at %d BAUD\n", baud);
	num = 0;
	send_num = 0;
	recv_num = 0;

	// bootstrap will send 0xB600 -> 0xB800 for write verification

	while (ReadFile(hComm, &recv_buffer[recv_num], 0x40, &num, NULL)) {
		if (ABORT) {
			printf("\n");
			goto EXIT;
		}
		recv_num = recv_num + num;
		if (num != 0x40) {
			if (recv_num >= 0x200) {
				goto Save;
			}
			else {
				printf("An error occurred while downloading EEPROM for verification\n");
				goto EXIT;
			}
		}
		printf("\r");
		printf("0x%02X bytes received", recv_num);
	}
Save:
	printf("\n");
	if (memcmp(file_buffer, recv_buffer, 0x200)){
		printf("EEPROM flash failed\n");
		goto EXIT;
	}
	printf("EEPROM flash success\n");
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
	if (file_buffer){
		free(file_buffer);
		file_buffer = 0;
	}
	if (name_buffer){
		free(name_buffer);
		name_buffer = 0;
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

