
#include<windows.h>
#include<stdio.h>
#include<malloc.h>
#include<winbase.h>
#include<string.h>
#include "bootmainall.h"
#include "chipid.h"
#include "hidusb-tool.h"
#include <setupapi.h>
#include <hidsdi.h>
#include <hidpi.h>

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
#define USB_RELAY_VENDOR_NAME	"www.dcttech.com"
#define USB_RELAY_NAME_PREF		"USBRelay"  // + number
#define USB_RELAY_ID_STR_LEN	5 /* length of "unique serial number" in the devices */

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

static int rel_read_status_raw(USBDEVHANDLE dev, void *raw_data);

#define printerr(fmt, ...) fprintf(stderr, fmt, ## __VA_ARGS__);

/*
* Convert UTF-16 null term. string to single byte (ASCII or ISO Latin)
* change all weird characters to "?"
*/
static void usbstring_to_ascii(unsigned short *wp, char *cp, int size)
{
	unsigned short *wpend = wp + (size / sizeof(unsigned short));
	for (; wp < wpend;)
	{
		unsigned short h = *wp++;
		*cp++ = (h < 0xFF) ? (char)h : '?';
		if (h == 0)
			break;
	}
}

/*
* Read HID string for vendor and device, return as ASCII (or ISO Latin...)
*/
int usbhidGetVendorString(USBDEVHANDLE usbh, char *buffer, int len)
{
	/* HidD_GetManufacturerString returns zero terminated UTF-16 string */
	/* Error if buffer is too short */
	if (!HidD_GetManufacturerString((HANDLE)usbh, (void*)buffer, len)) {
		DEBUG_PRINT(("error obtaining vendor name\n"));
		return USBHID_ERR_IO_HID;
	}
	usbstring_to_ascii((UINT16*)buffer, buffer, len);
	return 0;
}

int usbhidGetProductString(USBDEVHANDLE usbh, char *buffer, int len)
{
	/* HidD_GetProductString returns zero terminated UTF-16 string */
	/* Error if buffer is too short */
	if (!HidD_GetProductString((HANDLE)usbh, (void*)buffer, len)) {
		DEBUG_PRINT(("error obtaining product name\n"));
		return USBHID_ERR_IO_HID;
	}
	usbstring_to_ascii((UINT16*)buffer, buffer, len);
	return 0;
}

/*
* Enumerate HID USB devices.
* In Windows this will find also non-USB devices, but assume that
* filtering by PID & VID is enough.
* Some HID devices (mice, kbd) are locked by Windows and cannot be opened.
* If we cannot open a device for R&W, we skip it without error.
* Assume our devices are not of types reserved by Windows.
*/
int usbhidEnumDevices(int vendor, int product,
	void *context,
	int(*usbhidEnumFunc)(USBDEVHANDLE usbh, void *ctx))
{
	GUID                                hidGuid;        /* GUID for HID class */
	HDEVINFO                            deviceInfoList;
	SP_DEVICE_INTERFACE_DATA            deviceInfo;
	SP_DEVICE_INTERFACE_DETAIL_DATA_W   *deviceDetails = NULL;
	DWORD                               size;
	int                                 i;
	int openFlags = 0;
	int                                 errorCode = USBHID_ERR_NOTFOUND;
	HANDLE                              handle = INVALID_HANDLE_VALUE;
	HIDD_ATTRIBUTES                     deviceAttributes;
	BOOL b;

	HidD_GetHidGuid(&hidGuid);
	deviceInfoList = SetupDiGetClassDevsW(&hidGuid, NULL, NULL, DIGCF_PRESENT | DIGCF_INTERFACEDEVICE);
	if (!deviceInfoList || deviceInfoList == INVALID_HANDLE_VALUE)
	{
		return USBHID_ERR_NOTFOUND;
	}

	deviceInfo.cbSize = sizeof(deviceInfo);
	for (i = 0;; i++) {
		if (handle != INVALID_HANDLE_VALUE) {
			CloseHandle(handle);
			handle = INVALID_HANDLE_VALUE;
		}
		if (!SetupDiEnumDeviceInterfaces(deviceInfoList, 0, &hidGuid, i, &deviceInfo))
			break;  /* no more entries */
		/* First do a dummy call just to determine the actual size required */
		size = 0;
		SetupDiGetDeviceInterfaceDetailW(deviceInfoList, &deviceInfo, NULL, 0, &size, NULL);
		if (size == 0)
			continue;
		if (deviceDetails != NULL)
			free(deviceDetails);
		deviceDetails = (SP_DEVICE_INTERFACE_DETAIL_DATA_W*)malloc(size);
		if (!deviceDetails) {
			DEBUG_PRINT(("ALLOC ERROR!\n"));
			continue;
		}
		deviceDetails->cbSize = sizeof(*deviceDetails);
		/* 2nd call */
		b = SetupDiGetDeviceInterfaceDetailW(deviceInfoList, &deviceInfo, deviceDetails, size, &size, NULL);
		if (!b)
			continue;
		DEBUG_PRINT(("checking HID path \"%s\"\n", deviceDetails->DevicePath));

		handle = CreateFileW(deviceDetails->DevicePath,
			GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, openFlags, NULL);
		if (handle == INVALID_HANDLE_VALUE){
			DEBUG_PRINT(("open USB device failed: gle=%d\n", (int)GetLastError()));
			/* Opening devices owned by OS or other apps will fail ; just ignore these. */
			continue;
		}
		deviceAttributes.Size = sizeof(deviceAttributes);
		HidD_GetAttributes(handle, &deviceAttributes);
		DEBUG_PRINT(("device attributes: vid=%d pid=%d ver=%4.4X\n", deviceAttributes.VendorID, deviceAttributes.ProductID, deviceAttributes.VersionNumber));
		if (deviceAttributes.VendorID != vendor || deviceAttributes.ProductID != product)
			continue;   /* skip this device */
		errorCode = 0;
		if (0 == usbhidEnumFunc((USBDEVHANDLE)handle, context))
		{
			break; /* stop enumeration */
		}

		/* Now the handle is owned by the callback It may close it before return or later. */
		handle = INVALID_HANDLE_VALUE;
	}

	SetupDiDestroyDeviceInfoList(deviceInfoList);
	if (deviceDetails != NULL)
		free(deviceDetails);

	return errorCode;
}

void usbhidCloseDevice(USBDEVHANDLE usbh)
{
	CloseHandle((HANDLE)usbh);
}

int usbhidSetReport(USBDEVHANDLE usbh, char *buffer, int len)
{
	BOOLEAN rval;
	rval = HidD_SetFeature((HANDLE)usbh, buffer, len);
	return rval == 0 ? USBHID_ERR_IO_HID : 0;
}

int usbhidGetReport(USBDEVHANDLE usbh, int reportNumber, char *buffer, int *len)
{
	BOOLEAN rval = 0;
	buffer[0] = (char)reportNumber;
	rval = HidD_GetFeature((HANDLE)usbh, buffer, *len);
	return rval == 0 ? USBHID_ERR_IO_HID : 0;
}

int usbhidStrerror_r(int err, char *buf, int len)
{
	const char *s;
	switch (err) {
	case USBHID_ERR_ACCESS:      s = "Access to device denied";
		break;
	case USBHID_ERR_NOTFOUND:    s = "The specified device was not found";
		break;
	case USBHID_ERR_IO:          s = "Communication error with device";
		break;
	case USBHID_ERR_IO_HID:      s = "HID I/O error with device";
		break;
	default:
		s = "";
	}
	return snprintf(buf, len, "%s", s);
}

static const char *usbErrorMessage(int errCode)
{
	static char buffer[80];
	buffer[0] = 0;
	if (errCode != USBHID_ERR_UNKNOWN) {
		usbhidStrerror_r(errCode, buffer, sizeof(buffer));
	}
	if (0 == buffer[0]) {
		snprintf(buffer, sizeof(buffer), "Unknown error (%d)", errCode);
	}
	return buffer;
}

static struct
{
	USBDEVHANDLE mydev;
	char id[USB_RELAY_ID_STR_LEN * 2];
} g_enumCtx;

static int g_max_relay_num = 0; // number of relays in the active device

static int enumFunc(USBDEVHANDLE dev, void *context)
{
	static const char vendorName[] = USB_RELAY_VENDOR_NAME;
	static const char productName[] = USB_RELAY_NAME_PREF;
	int err;
	char buffer[128 * sizeof(short)]; // max USB string is 128 UTF-16 chars
	int num = 0;
	int i;

	err = usbhidGetVendorString(dev, buffer, sizeof(buffer));
	if (err || 0 != strcmp(buffer, vendorName))
	{
		goto next;
	}

	err = usbhidGetProductString(dev, buffer, sizeof(buffer));
	if (err)
	{
		goto next;
	}

	i = (int)strlen(buffer);
	if (i != (int)strlen(productName) + 1)
	{
		goto next;
	}

	/* the last char of ProductString is number of relays */
	num = (int)(buffer[i - 1]) - (int)'0';
	buffer[i - 1] = 0;

	if (0 != strcmp(buffer, productName))
	{
		goto next;
	}

	if (num <= 0 || num > 8)
	{
		printerr("Unknown relay device? num relays=%d\n", num);
		goto next;
	}

	/* Check the unique ID: USB_RELAY_ID_STR_LEN bytes at offset 1 (just after the report id) */
	err = rel_read_status_raw(dev, buffer);
	if (err < 0)
	{
		printerr("Error reading report 0: %s\n", usbErrorMessage(err));
		goto next;
	}

	for (i = 1; i <= USB_RELAY_ID_STR_LEN; i++)
	{
		unsigned char x = (unsigned char)buffer[i];
		if (x <= 0x20 || x >= 0x7F)
		{
			fprintf(stderr, "Bad device ID!\n");
			goto next;
		}
	}

	if (buffer[USB_RELAY_ID_STR_LEN + 1] != 0)
	{
		printerr("Bad device ID!\n");
		goto next;
	}

	DEBUG_PRINT(("Device %s%d found: ID=[%5s]\n", productName, num, &buffer[1]));
	g_max_relay_num = num;

	if (g_enumCtx.id[0] != 0)
	{
		if (0 != memcmp(g_enumCtx.id, &buffer[1], USB_RELAY_ID_STR_LEN))
			goto next;
	}
#if 0
	if (g_enumCtx.mydev)
	{
		printerr("ERROR: More than one relay device found. ID must be specified\n");
		usbhidCloseDevice(dev);
		usbhidCloseDevice(g_enumCtx.mydev);
		return 0;
	}
#endif
	g_enumCtx.mydev = dev;
	return 0; /* stop */

next:
	/* Continue search */
	usbhidCloseDevice(dev);
	return 1;
}

static USBDEVHANDLE openDevice(void)
{
	int err;
	err = usbhidEnumDevices(USB_CFG_VENDOR_ID, USB_CFG_DEVICE_ID, &g_enumCtx, enumFunc);

	if (err || !g_enumCtx.mydev)
	{
		printerr("error finding USB relay: %s\n", usbErrorMessage(err));
		return NULL;
	}

	return g_enumCtx.mydev;
}

// Read state of all relays
// @return bit mask of all relays (R1->bit 0, R2->bit 1 ...) or -1 on error
static int rel_read_status_raw(USBDEVHANDLE dev, void *raw_data)
{
	char buffer[10];
	int err;
	int reportnum = 0;
	int len = 8 + 1; // report id 1 byte + 8 bytes data
	memset(buffer, 0, sizeof(buffer));

	err = usbhidGetReport(dev, reportnum, buffer, &len);
	if (err) {
		printerr("error reading status: %s\n", usbErrorMessage(err));
		return -1;
	}

	if (len != 9 || buffer[0] != reportnum) {
		printerr("ERROR: wrong HID report returned! %d\n", len);
		return -2;
	}

	if (raw_data) {
		// copy raw report data
		memcpy(raw_data, buffer, len);
	}

	return (unsigned char)buffer[8]; // byte of relay states
}

// Turn relay on/off.
// @param relaynum: positive (1-N): one relay index, negative: all, -num = number of relays
// @returns 0 ok, else error
static int rel_onoff(USBDEVHANDLE dev, int is_on, int relaynum)
{
	unsigned char buffer[10];
	int err = -1;
	unsigned char cmd1, cmd2, mask, maskval;

	if (relaynum < 0 && (-relaynum) <= 8) {
		mask = 0xFF;
		cmd2 = 0;
		if (is_on) {
			cmd1 = 0xFE;
			maskval = (unsigned char)((1U << (-relaynum)) - 1);
		}
		else {
			cmd1 = 0xFC;
			maskval = 0;
		}
	}
	else {
		if (relaynum <= 0 || relaynum > 8) {
			printerr("Relay number must be 1-8\n");
			return 1;
		}
		mask = (unsigned char)(1U << (relaynum - 1));
		cmd2 = (unsigned char)relaynum;
		if (is_on) {
			cmd1 = 0xFF;
			maskval = mask;
		}
		else {
			cmd1 = 0xFD;
			maskval = 0;
		}
	}

	memset(buffer, 0, sizeof(buffer));
	buffer[0] = 0; /* report # */
	buffer[1] = cmd1;
	buffer[2] = cmd2;
	if ((err = usbhidSetReport(dev, (char*)buffer, 9)) != 0) {
		printerr("Error writing data: %s\n", usbErrorMessage(err));
		return 1;
	}

	// Read back & verify
	err = rel_read_status_raw(dev, NULL);
	if (err < 0) {
		printerr("Error read back: %s\n", usbErrorMessage(err));
		return 1;
	}

	err = err & mask;
	if (err != maskval) {
		printerr("Error: failed to set relay %u %s\n", relaynum, is_on ? "ON" : "OFF");
		return 1;
	}

	return 0;
}

static int show_status(USBDEVHANDLE dev)
{
	int err;
	char buffer[10];
	static const char* on_off[] = { "OFF", "ON" };

#define onoff(n) on_off[!!(err & (1U << n))]

	err = rel_read_status_raw(dev, buffer);
	if (err < 0) {
		printerr("Error reading data: %s\n", usbErrorMessage(err));
		err = 1;
	}
	else {
		switch (g_max_relay_num) {
		case 1:
			printf("Board ID=[%5.5s] State: R1=%s\n", &buffer[1], onoff(0));
			break;
		case 2:
			printf("Board ID=[%5.5s] State: R1=%s R2=%s\n",
				&buffer[1], onoff(0), onoff(1));
			break;
		case 4:
			printf("Board ID=[%5.5s] State: R1=%s R3=%s R1=%s R4=%s\n",
				&buffer[1], onoff(0), onoff(1), onoff(2), onoff(3));
			break;
		default: // print as bit mask
			printf("Board ID=[%5.5s] State: %2.2X (hex)\n", &buffer[1], (unsigned char)err);
			break;
		}
		err = 0;
	}
	return err;
#undef onoff
}

static int showFunc(USBDEVHANDLE dev, void *context)
{
	int err = enumFunc(dev, context);
	if (err != 0 || g_enumCtx.mydev == 0) // not my device, continue
		return err;

	show_status(g_enumCtx.mydev);
	usbhidCloseDevice(g_enumCtx.mydev);
	g_enumCtx.mydev = 0;

	return 1; // continue
}

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
		rel_onoff(dev, OFF, -4);
		if (dev) {
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
// at this point bootmainall is wating for some
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
	// third byte of the headder is the command size

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


