
#include "stdafx.h"
#include<windows.h>
#include<stdio.h>
#include<malloc.h>

HANDLE hBuff = 0;
#define BUFF_SIZE   0x100001
unsigned char *file_buffer = 0;

void usage() {
	printf("\nSBEC_checksum /F:[filename]\n");
	printf("/F:[filename] 32/56 kilobyte eeprom file\n");
	printf("/W write checksum\n");
	return;
}

unsigned char checksum(unsigned char *file , unsigned int length)
{
	unsigned char sum = 0;

	for (unsigned int i = 0; i < length; i++){
		sum += file[i];
	}

	return sum;
}

int main(int argc, char *argv[])
{
	int ret = 1;
	BOOL write_checksum = FALSE;
	unsigned int eeprom_size = 0x8000;
	unsigned long num = 0;
	unsigned char file_checksum = 0;
	unsigned char file_correction = 0;
	unsigned char calculated_checksum = 0;
	unsigned char calculated_correction = 0;

	if (argc < 2){
		usage();
		return ret;
	}
	for (int i = 1; i < argc; i++)
	{
		if (argv[i][1] == 'f' ||
			argv[i][1] == 'F')
		{
			if (argv[i][2] == ':')
			{
				hBuff = CreateFileA(&argv[i][3], GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
				if (hBuff == INVALID_HANDLE_VALUE)
				{
					printf("Can't open file %s\n", &argv[i][3]);
					return ret;
				}
				if ((GetFileSize(hBuff, NULL) != 0x8000) &
					(GetFileSize(hBuff, NULL) != 0xE000)) {
					printf("Wrong file size\n");
					return ret;
				}
			}
		}
		if (argv[i][1] == 'w' ||
			argv[i][1] == 'W')
		{
			write_checksum = TRUE;
		}
	}
	file_buffer = (unsigned char *)malloc(BUFF_SIZE);
	if (!file_buffer){
		goto EXIT;
	}

	memset(file_buffer, 0x00, BUFF_SIZE);
	
	eeprom_size = GetFileSize(hBuff, NULL);

	if (!ReadFile(hBuff, file_buffer, eeprom_size, &num, NULL)){
		printf("ERROR: reading eeprom file\n");
		goto EXIT;
	}

	file_checksum = file_buffer[5];
	file_correction = file_buffer[12];
	calculated_checksum = checksum(file_buffer, eeprom_size);
	calculated_correction = file_checksum - calculated_checksum;
	calculated_correction += file_correction;

	printf("\nfile values:\n");
	printf("checksum 0x%02X correction 0x%02X\n", file_checksum, file_correction);
	printf("\ncalculated values:\n");
	printf("checksum 0x%02X correction 0x%02X\n", calculated_checksum, calculated_correction);
	
	if ((file_checksum == calculated_checksum) & (file_correction == calculated_correction))
	{
		printf("\nchecksum is correct\n\n");
		ret = 0;
		goto EXIT;
	}
	else
	{
		printf("\n>>>> checksum is incorrect <<<<\n\n");
	}
	
	if (write_checksum)
	{
		printf("correcting checksum\n");
		file_buffer[12] = calculated_correction;
		calculated_checksum = 0;
		calculated_correction = 0;
		calculated_checksum = checksum(file_buffer, eeprom_size);
		printf("checksum 0x%02X correction 0x%02X\n", calculated_checksum, file_buffer[12]);
		if (file_checksum == calculated_checksum)
		{
			printf("\nchecksum is correct\n\n");
			SetFilePointer(hBuff, -eeprom_size, NULL, FILE_END);
			WriteFile(hBuff, file_buffer, eeprom_size, &num, NULL);
			ret = 0;
			goto EXIT;
		}
		else
		{
			printf("\n>>>> checksum is incorrect <<<<\n");
			printf("\n>>>>     unknown error     <<<<\n");
			goto EXIT;
		}
	}
	else
	{
		ret = 0;
		goto EXIT;
	}

EXIT:
	if (hBuff){
		CloseHandle(hBuff);
		hBuff = 0;
	}
	if (file_buffer){
		free(file_buffer);
		file_buffer = 0;
	}
	return ret;
}

