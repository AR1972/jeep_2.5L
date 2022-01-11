
#include<windows.h>
#include<stdio.h>
#include<malloc.h>
#include "erase_tosh.h"
#include "hidusb-tool.h"

int rel_onoff(USBDEVHANDLE dev, int is_on, int relaynum);
USBDEVHANDLE openDevice(void);

#define RELAY_PWR   4 // off = 0v on = 12v
#define RELAY_KEY   3 // off = 0v on = 12v
#define RELAY_VSEL  2 // off = 12v on = 20v
#define RELAY_DATA  1 // off = data on = 12v
#define ON          1
#define OFF         0
#define BOOTSTRAP   0
#define PROGRAM     1
#define DATA        0
#define VSEL        1
#define BUFF_SIZE   0x10001

char *device = 0;
HANDLE hComm = 0;
HANDLE hBuff = 0;
unsigned char *recv_buffer = 0;
COMMTIMEOUTS timeouts = { 0 };
DCB state = { 0 };
static USBDEVHANDLE dev = 0;
BOOL ABORT = FALSE;

void usage() {
    printf("\nSBEC_erase_tosh /C:[1-9]\n");
    printf("\n/C:[1-9] COM port 1 to 9\n");
    printf("\n/B erase 64k eeproms\n");
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
        if (device) {
            free(device);
            device = 0;
        }
        if (dev) {
            rel_onoff(dev, OFF, -4);
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
    int retry_num = 0;
    unsigned long send_num = 0;
    unsigned long recv_num = 0;
    unsigned long num = 0;
    const int max_retry = 30;
    unsigned long baud = 9600;
    DWORD dwAttrib = 0;
    char com[] = "0\0\0\0";
    BOOL big_eeprom = FALSE;

    if (argc < 2){
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
            if (argv[i][1] == 'b' ||
                argv[i][1] == 'B')
            {
                big_eeprom = TRUE;
                erase_tosh[0x1F + 1] -= 0x80;
                erase_tosh[0x23 + 1] -= 0x80;
                erase_tosh[0x26 + 1] -= 0x80;
                erase_tosh[0x2A + 1] -= 0x80;
                erase_tosh[0x38 + 1] -= 0x80;
                erase_tosh[0x3B + 1] -= 0x80;
            }
        }
    }

    SetConsoleCtrlHandler(consoleHandler, TRUE);

    // get some memory for buffers

    recv_buffer = (unsigned char *)malloc(0x10001);
    if (!recv_buffer){
        goto EXIT;
    }
    device = (char *)malloc(0x20);
    if (!device) {
        goto EXIT;
    }


    //null out buffers
    memset(recv_buffer, 0x00, BUFF_SIZE);

    sprintf(device, "\\\\.\\COM%s", com);

    dev = openDevice();
    if (!dev) {
        printf("ERROR: opening relay board\n");
        goto EXIT;
    }
    // turn all relays off
    if (dev){
        if (rel_onoff(dev, OFF, -4))
            goto EXIT;
    }

    // create serial port handle

    hComm = CreateFileA(device, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);

    if (hComm == INVALID_HANDLE_VALUE) {
        printf("ERROR: opening COM%s\n", com);
        goto EXIT;
    }
    else {
        printf("Success opening COM%s\n", com);
    }

    if (!GetCommState(hComm, &state)) {
        printf("ERROR: getting COM state\n");
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
        printf("ERROR: setting COM timeouts\n");
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
        printf("ERROR: setting COM state\n");
        goto EXIT;
    }

    if (dev){
        if (rel_onoff(dev, BOOTSTRAP, RELAY_VSEL))
            goto EXIT;
    }
    if (dev){
        if (rel_onoff(dev, VSEL, RELAY_DATA))
            goto EXIT;
    }

    Sleep(100);

    if (dev){
        if (rel_onoff(dev, ON, RELAY_PWR))
            goto EXIT;
    }
    if (dev) {
        if (rel_onoff(dev, ON, RELAY_KEY))
            goto EXIT;
    }

    Sleep(100);

    // ECU sends 0x00 when it enters bootstrap mode

    recv_buffer[0] = 0xAA;

    if (ReadFile(hComm, recv_buffer, 1, &num, NULL)) {
        if (num == 1 && recv_buffer[0] == 0x00) {
            printf("Received: 0x%02X\nECU is in bootstrap mode\n", recv_buffer[0]);
        }
        else {
            printf("Received: 0x%02X\nERROR: ECU not in bootstrap mode\n", recv_buffer[0]);
            goto EXIT;
        }
    }
    else {
        printf("Received: 0x%02X\nERROR: ECU not in bootstrap mode\n", recv_buffer[0]);
        goto EXIT;
    }

    // ECU is in bootstrap mode disconnect 12 volts
    // from pin 45 and connect COM port TXD

    if (dev) {
        if (rel_onoff(dev, DATA, RELAY_DATA))
            goto EXIT;
    }

    Sleep(100);

    if (dev){
        if (rel_onoff(dev, PROGRAM, RELAY_VSEL))
            goto EXIT;
    }

    // when bootstrap voltage is disconnected we will
    // receive a 0x00, wait up to 5 seconds for it.

    ReadFile(hComm, recv_buffer, 1, &recv_num, NULL);

    // bootstrap download only seems to work at 1200 BAUD

    state.DCBlength = sizeof(DCB);
    state.BaudRate = 1200;
    state.ByteSize = 8;
    state.Parity = NOPARITY;
    state.StopBits = ONESTOPBIT;
    if (!SetCommState(hComm, &state)) {
        printf("ERROR: setting COM state\n");
        goto EXIT;
    }

    memset(recv_buffer, 0x00, BUFF_SIZE);

    // set the BAUD rate of the bootstrap

    if (baud == 1200) {
        erase_tosh[8] = 0x33;
    }
    else if (baud == 9600) {
        erase_tosh[8] = 0x30;
    }

    // purge garbage from serial port buffers

    if (!FlushFileBuffers(hComm)) {
        printf("ERROR: flushing file buffers\n");
        goto EXIT;
    }

    // need to let the data lines settle a little after power on

    Sleep(2000);
    if (ABORT)
        goto EXIT;

    // send bootstrap to ECU, ECU's that use the 68HC11E9
    // have variable length download, bootstrap length
    // of 257 bytes should work in all cases.

    printf("Sending EEPROM erase program\n");
    if (!WriteFile(hComm, erase_tosh, sizeof(erase_tosh), &send_num, NULL)) {
        printf("ERROR: sending erase program\n");
        goto EXIT;
    }
    printf("Bytes TX: 0x%02X\n", send_num);

    // ECU echos back characters sent, check
    // if it sent 256 bytes back, if 256 bytes
    // were not received, enter retry loop

    if (ABORT)
        goto EXIT;

    // 68HC11E9 based ECU's need this, seems like variable
    // length download sends a 0x00 to signal it has jumped
    // to the code we sent?? catch the 0x00 now or it ends
    // up in our buffer later, triggering a bug hunt.

    Sleep(585);

    // the bootstrap sits in a loop for about 100ms to give us
    // time to apply 20 volts to pin 45, if 20 volts isn't
    // applied in time the chip id function will fail.

    if (!ReadFile(hComm, recv_buffer, 0x100, &recv_num, NULL)) {
        printf("ERROR: reading from COM port\n");
    }

    // purge garbage from serial port buffers

    if (!FlushFileBuffers(hComm)) {
        printf("failed to flush file buffers\n");
        goto EXIT;
    }

    printf("Bytes RX: 0x%02X\n", recv_num);

    if (recv_num != 0x100) {
        retry_num++;

        if (dev) {
            if (rel_onoff(dev, OFF, -4))
                goto EXIT;
        }
        if (retry_num >= max_retry) {
            printf("ERROR: erase failed after %d attempts\n", retry_num);
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

    if ((memcmp(erase_tosh + 1, recv_buffer, 0xFF) != 0) &
        (memcmp(erase_tosh + 1, recv_buffer + 1, 0xFF) != 0)) {
        printf("ERROR: erase program is corrupt\n");
        retry_num++;

        if (dev) {
            if (rel_onoff(dev, OFF, -4))
                goto EXIT;
        }

        if (retry_num >= max_retry) {
            printf("ERROR: erase failed after %d attempts\n", retry_num);
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
        printf("ERROR: setting COM state\n");
        goto EXIT;
    }

    timeouts.ReadIntervalTimeout = 0;
    timeouts.ReadTotalTimeoutConstant = 500;
    timeouts.ReadTotalTimeoutMultiplier = 0;
    timeouts.WriteTotalTimeoutConstant = 500;
    timeouts.WriteTotalTimeoutMultiplier = 0;
    if (!SetCommTimeouts(hComm, &timeouts)) {
        printf("ERROR: setting COM timeouts\n");
        goto EXIT;
    }

    if (ABORT)
        goto EXIT;

    WriteFile(hComm, &recv_buffer[0x10001], 1, &send_num, NULL);

    rel_onoff(dev, VSEL, RELAY_DATA); // apply 20v to pin 45

    printf("Erasing EEPROM\n");
    Sleep(2500);

    rel_onoff(dev, DATA, RELAY_DATA); // disconnect 20v to pin 45

    printf("Erase verification\n");
    num = 0;
    send_num = 0;
    recv_num = 0;

    // bootstrap will send 0x8000 -> 0xFFFF for write verification

    while (ReadFile(hComm, &recv_buffer[recv_num], 0x40, &num, NULL)) {
        if (ABORT) {
            printf("\n");
            goto EXIT;
        }
        recv_num += num;
        if (num != 0x40) {
            if (recv_num >= 0x8000) {
                goto Save;
            }
            else {
                printf("\nERROR: downloading EEPROM for verification\n");
                goto EXIT;
            }
        }
        printf("\r");
        printf("Bytes RX: 0x%02X", recv_num);
    }

Save:

    printf("\n");
    for (int i = 0; i < 0x8000; i++){
        // skip the MCU eeprom
        if (i == 0x3600){
            i = 0x3800;
        }
        if (recv_buffer[i] != 0xFF){
            printf("EPROM erase failed @ 0x%04X\n", i);
            goto EXIT;
        }
    }

    printf("EPROM erase success\n");

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
    if (device) {
        free(device);
        device = 0;
    }
    if (dev) {
        rel_onoff(dev, OFF, -4);
        usbhidCloseDevice(dev);
        dev = 0;
    }
    if (hComm){
        CloseHandle(hComm);
        hComm = 0;
    }
    return ret;
}



