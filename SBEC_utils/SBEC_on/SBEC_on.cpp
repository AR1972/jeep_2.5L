#include<windows.h>
#include<stdio.h>
#include<malloc.h>
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

#define USB_RELAY_BOARD

static USBDEVHANDLE dev = 0;

BOOL WINAPI consoleHandler(DWORD signal) {
    if (signal == CTRL_C_EVENT) {
        if (dev) {
            rel_onoff(dev, OFF, -4);
            usbhidCloseDevice(dev);
            dev = 0;
        }
    }
    return TRUE;
}

int main(int argc, char *argv[])
{
    int ret = 1;
    BOOL bootstrap = FALSE;

    if (argc != 2 || strlen(argv[1]) > 1) {
        printf("0 = normal\n");
        printf("1 = bootstrap\n");
        return ret;
    }

    if (*argv[1] == '1') {
        bootstrap = TRUE;
    }
    else if (*argv[1] == '0') {
        bootstrap = FALSE;
    }
    else {
        goto EXIT;
    }

    SetConsoleCtrlHandler(consoleHandler, TRUE);

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

    if (bootstrap) {
        if (dev){
            if (rel_onoff(dev, BOOTSTRAP, RELAY_VSEL))
                goto EXIT;
        }

        if (dev){
            if (rel_onoff(dev, VSEL, RELAY_DATA))
                goto EXIT;
        }
    }
    else if (!bootstrap){
        if (dev){
            if (rel_onoff(dev, DATA, RELAY_DATA))
                goto EXIT;
        }
    }
    else {
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

    if (bootstrap){
        Sleep(250);
        if (dev){
            if (rel_onoff(dev, DATA, RELAY_DATA))
                goto EXIT;
        }
    }

    printf("Press any key to power off ECU");
    getchar();
    ret = 0;

EXIT:

    if (dev) {
        rel_onoff(dev, OFF, -4);
        usbhidCloseDevice(dev);
        dev = 0;
    }
    return ret;
}
