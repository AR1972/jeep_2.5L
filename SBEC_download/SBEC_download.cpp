
#include<windows.h>
#include<stdio.h>
#include<malloc.h>
#include "dump.h"

int main(int argc, char *argv[])
{

	char *device = "\\\\.\\COM5\0\0";
	HANDLE hComm;
	HANDLE hBuff;
	int ret = 0;
	unsigned long i = 0;
	int retry_num = 0;
	unsigned char *recv_buffer;
	unsigned char *send_buffer;
	unsigned char *save_buffer;
	char *name_buffer;
	unsigned long send_num = 0;
	unsigned long recv_num = 0;
	unsigned long num = 0;
    const int max_retry = 30;
	unsigned long baud = 1200;
	COMMTIMEOUTS timeouts = {0};
	DCB state = {0};

	if (argc != 2 || strlen(argv[1]) > 1) {
		printf("please supply COM port number\n");
		printf("correct value is 1 through 9\n");
		return 1;
	}

// get some memory for buffers

	recv_buffer = (unsigned char *)malloc(0xE001);
	send_buffer = (unsigned char *)malloc(0x201);
	name_buffer = (char *)malloc(0x10);
	save_buffer = (unsigned char *)malloc(0x10000);
		
//null out buffers

	for (i=0; i < 0x10000; ++i) {
		save_buffer[i] = (unsigned char) 0x00;
	}

	for (i=0; i < 0xE001; ++i) {
		recv_buffer[i] = (unsigned char) 0x00;
	}

	for (i=0; i < 0x10; ++i) {
		name_buffer[i] = (unsigned char) 0x00;
	}

// prepare buffer to send bootstrap

	for (i=0; i < 0x201; ++i) {
		if (i < sizeof(dump)){
			send_buffer[i] = dump[i];
		} else {
			send_buffer[i] = (unsigned char) 0x00;
		}
	}

	sprintf(device,"\\\\.\\COM%s", argv[1]);

// create seiral port handle

	hComm = CreateFileA(device, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);

	if (hComm == INVALID_HANDLE_VALUE) {
		printf("Error in opening COM%s\n", argv[1]);
		goto EXIT;
	} else {
		printf("opening COM%s successful\n", argv[1]);
	}

// setup comport timeouts

	timeouts.ReadIntervalTimeout = 0;
	timeouts.ReadTotalTimeoutConstant = 8000;
	timeouts.ReadTotalTimeoutMultiplier = 0;
	timeouts.WriteTotalTimeoutConstant = 8000;
	timeouts.WriteTotalTimeoutMultiplier = 0;
	ret = SetCommTimeouts(hComm, &timeouts);

Start:

// setup serial port, ECU seems to start at 9600 BAUD
// then switches to 1200 BAUD, setup for 9600 BAUD to 
// capture the BREAK the ECU sends to signal it has 
// entered bootstrap mode.

	state.DCBlength = sizeof(DCB);
	state.BaudRate = 9600;
	state.ByteSize = 8;
	state.Parity = NOPARITY;
	state.StopBits = ONESTOPBIT;
	state.fDtrControl = 1; // apply 12 volts to pin 45
	state.fRtsControl = 0; // ECU power off
	ret = SetCommState(hComm, &state);
	Sleep(50);
	state.fRtsControl = 1; // ECU power on
	ret = SetCommState(hComm, &state);


// ECU sends 0x00 when it enters bootstrap mode

	ret = ReadFile(hComm, recv_buffer, 1, &num, NULL);
	printf("ECU sent 0x%02X\n", recv_buffer[0]);

// ECU is in bootstrap mode disconnect 12 volts
// from pin 45 and connect COM port TXD

	state.fDtrControl = 0; // disconnect 12 volts from pin 45
	ret = SetCommState(hComm, &state);

// if someting other than 0x00 was reveived GTFO

	if (recv_buffer[0] != 0x00){
		goto EXIT;
	}

// bootstrap download only seems to work at 1200 BAUD

	state.DCBlength = sizeof(DCB);
	state.BaudRate = 1200;
	state.ByteSize = 8;
	state.Parity = NOPARITY;
	state.StopBits = ONESTOPBIT;
	ret = SetCommState(hComm, &state);


// give ECU a few secondes to settle, seems to help?

	printf("Waiting for ECU to settle\n");
	Sleep(5000);
    
// purge garbage from serial port buffers

	ret = FlushFileBuffers(hComm);

// send bootstrap to ECU, ECU's that use the 68HC11E9
// have variable length download, bootstrap length
// of 257 bytes should work in all cases.

	printf("Sending bootstrap...\n");
	ret = WriteFile(hComm, send_buffer, 0x101, &send_num, NULL);
	printf("%d bytes sent\n", send_num);

// ECU echos back charaters sent, check
// if it send 256 bytes back, if 256 bytes
// were not recieved, enter retry loop
// TODO: compair send and recieve buffers

	ret = ReadFile(hComm, recv_buffer, 0x100, &recv_num, NULL);
	if (recv_num != 0x100) {
		retry_num++;
		state.fDtrControl = 0; // disconnect 12 volts from pin 45
		state.fRtsControl = 0; // power ECU off
		ret = SetCommState(hComm, &state);
		if (retry_num >= max_retry) {
			printf("ERPOM download failed after %d attempts", retry_num);
			getchar();
			goto EXIT;
		}
		printf("retry %d\n", retry_num);
		Sleep(2000);
		goto Start;
	}

// bootstrap sets SCI port to 1200 BAUD,
// reset COM port, doesn't seem nessary
// setting this to 9600 BAUD works with
// FTDI based USB adapters but tends to
// lose data on 'real' serial ports, likely
// due to the quick and dirty way we are 
// connecting to the ECU. Byte 9 of the
// bootstrap will need to be changed from
// 0x33 to 0x30 to set the ECU to send
// at 9600 BAUD.

	state.DCBlength = sizeof(DCB);
	state.BaudRate = baud;
	state.ByteSize = 8;
	state.Parity = NOPARITY;
	state.StopBits = ONESTOPBIT;
	ret = SetCommState(hComm, &state);

// start capturing byte stream

	printf("Downloading...\n");
	i=0;
	send_num = 0;
	recv_num = 0;

// EPROM's can be 0x8000 or 0xE000, capture in 512 byte chunks
// check byte count when stream stops then save buffer

	while (ReadFile(hComm, &recv_buffer[i], 0x200, &num, NULL)) {
		i = i + num;
		recv_num = recv_num + num;
        printf("0x%02X bytes recived\n", recv_num);
		if (num != 0x200) {
			if (recv_num == 0x8000) {
				goto Save;
			} else if (recv_num == 0xE000) {
				goto Save;
			} else {
				retry_num++;
				state.fDtrControl = 0; // disconnect 12 volts from pin 45
				state.fRtsControl = 0; // power ECU off
				ret = SetCommState(hComm, &state);
				if (retry_num >= max_retry) {
					printf("ERPOM download failed after %d attempts", retry_num);
					getchar();
					goto EXIT;
				}
				printf("retry %d\n", retry_num);
				Sleep(2000);
				goto Start;
			}
		}
	}

Save:

// use ECU part number for filename

	sprintf(name_buffer, "%02X%02X%02X%02X.bin",recv_buffer[2], recv_buffer[3], recv_buffer[4], recv_buffer[5]);
    
// special handeling for 64k EPROM's

	if (recv_num == 0xE000) {

		// copy 64k EPROM to new buffer starting at offset 0x2000
		
		for (i=0; i < recv_num; i++) {
			save_buffer[0x2000+i] = recv_buffer[i];
		}
		
		// clear 68HC11 EEPROM
		
		for (i=0xB600; i<0xB800; i++) {
			save_buffer[i] = (unsigned char) 0xFF;
		}
		recv_buffer = save_buffer;
		recv_num = 0x10000;
	} else if (recv_num == 0x8000) {
		
		// clear 68HC11 EEPROM
		
		for (i=0x3600; i<0x3800; i++) {
			recv_buffer[i] = (unsigned char) 0xFF;
		}
	}


// save EPROM image to file

	hBuff = CreateFile(name_buffer,GENERIC_READ|GENERIC_WRITE, 0, NULL, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, NULL);
	ret = WriteFile(hBuff, recv_buffer, recv_num, &num, NULL);
	ret = CloseHandle(hBuff);

EXIT:
	state.fDtrControl = 0;
	state.fRtsControl = 0;
	ret = SetCommState(hComm, &state);
	CloseHandle(hComm);
	free(recv_buffer);
	free(send_buffer);
	free(name_buffer);
	free(save_buffer);
	return 0;
}