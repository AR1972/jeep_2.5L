/*
    This program is converts a motorola s-record file to a binary file.
    Copyright (C) 2012 Klaus Toscher

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

    Dieses Programm ist Freie Software: Sie koennen es unter den Bedingungen 
    der GNU General Public License, wie von der Free Software Foundation, 
    Version 2 der Lizenz oder (nach Ihrer Option) jeder neueren
    veroefentlichten Version, weiterverbreiten und/oder modifizieren. 

    Dieses Programm wird in der Hoffnung, dass es nuetzlich sein wird, aber
    OHNE JEDE GEWAEHRLEISTUNG, bereitgestellt; sogar ohne die implizite
    Gewaehrleistung der MARKTFAEHIGKEIT oder EIGNUNG FUER EINEN BESTIMMTEN ZWECK.
    Siehe die GNU General Public License fuer weitere Details.

    Sie sollten eine Kopie der GNU General Public License zusammen mit diesem
    Programm erhalten haben. Wenn nicht, schreiben Sie an die Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

	the author: klaus.toscher@web.de
*/


// --- identifier for supported hex formats ---
//

#include <stdio.h>
#include <ctype.h>

#include "kto_types.h"
#include "MotBinBinMot.h"
#include "logging.h"

#define INPUT_LINE_LEN		0x100

#define WIDTH_CHECKSUM      1		/* width in byte of checksum */
#define WIDTH_ADDR_16BIT    2		/* width in byte of 16bit address */
#define WIDTH_ADDR_24BIT    3		/* width in byte of 24bit address */
#define WIDTH_ADDR_32BIT    4		/* width in byte of 32bit address */

#define ASCII_NUL           '\0'
#define ASCII_LF            '\n'
#define ASCII_SP            ' '
#define ASCII_0             '0'
#define ASCII_7             '7'
#define ASCII_A             'A'



static void hexToBin_Debug(EXITCODE_e exitCode, uint_t logLevel, sint_t line);

static EXITCODE_e hexdigitsToInt(sc8_t highNibble, sc8_t lowNibble, sint_t *result);

static EXITCODE_e uint8ToHexdigits(uint8_t val, sc8_t *pChr);


static const sc8_t *exitCodeHexStr[] =
{
	"EXITCODE_NORMAL",	                	// 0
	"EXITCODE_WRONG_RECORD_TYPE",         	// 1
	"EXITCODE_CHECKSUM_ERROR",            	// 2
	"EXITCODE_NULL_PTR",                  	// 3
	"EXITCODE_UNVALID_FIRST_CHAR",        	// 4
	"EXITCODE_BYTE_CNT_OVERFLOW",         	// 5
	"EXITCODE_UNSUPPORTED_HEX_TYPE",      	// 6
	"EXITCODE_ADDRESS_RANGE_VIOLATION",     // 7
	"EXITCODE_ADDRESS_OUT_OF_RANGE",      	// 8
	"EXITCODE_HEXCHAR_CONVERTION",        	// 9
	"EXITCODE_FPUTS_PROBLEM",	 		    // 10
	"EXITCODE_FGETS_PROBLEM",	 		    // 11
    "EXITCODE_NO_DATA_CNTR"			        // 12
};
/* ---------------------- some helper functions ------------------------- */

void hexToBin_Debug(EXITCODE_e exitCode, LogLevel_e logLevel, sint_t line)
{
	if (LOG_LEVEL(logLevel))
	{
		printf("\n %s in file: %s, line: %d\n", exitCodeHexStr[exitCode], __FILE__, line);
	}
	else {}
}

/* ---------------------- some helper functions ------------------------- */

     
EXITCODE_e hexdigitsToInt(sc8_t highNibble, sc8_t lowNibble, sint_t *result)
{
    EXITCODE_e  exitCode = EXITCODE_NORMAL;
    sint_t      x;
    
	if (!isxdigit((sint_t)highNibble) || !isxdigit((sint_t)lowNibble))
	{
		exitCode = EXITCODE_HEXCHAR_CONVERTION;
	}	
	else if (result == NULL)
	{
		exitCode = EXITCODE_NULL_PTR;
	}
	else
	{
		x = toupper(highNibble);
		x -= (x >= ASCII_A) ? ASCII_7 : ASCII_0;
		*result = x << 4;

		x = toupper(lowNibble);
		x -= (x >= ASCII_A) ? ASCII_7 : ASCII_0;
        *result += x;
    }
        
    return (exitCode);
}

EXITCODE_e uint8ToHexdigits(uint8_t val, sc8_t *pChr)
{
	EXITCODE_e  exitCode = EXITCODE_NORMAL;
	sc8_t       chr;

	if (pChr == NULL)
	{
		exitCode = EXITCODE_NULL_PTR;
	}
	else
	{
		chr = (sc8_t) (val >> 4);	// convert high nibble
		chr += (chr >= 10) ? ASCII_7 : ASCII_0;
		*pChr++ = chr;

		chr = (sc8_t) (val & 0x0f); // convert low nibble
		chr += (chr >= 10) ? ASCII_7 : ASCII_0;
		*pChr++ = chr;
    }

    return (exitCode);
}

/*---------------------------------------------------------------------------*/

EXITCODE_e                  /* see enum definition of exit code */
mot2Bin
( FILE		*fileName       /**< [IN]  ptr to file to read from */
, uint8_t	*pDst           /**< [OUT] ptr to binary buffer */
, uint_t	dstSize         /**< [IN]  size of buffer */
, uint_t    *bytesWritten   /**< [OUT]  number of written bytes to binary file */
)
{
	sint_t	i, x;
    uint_t	adr, offset, mulFak;
	
	sint_t  lineCtr = 0;
	sint_t	dataCnt;
	uint_t	dataCntTotal = 0;
	sc8_t 	line[INPUT_LINE_LEN];
	sint_t	checkSum = 0;
	MOT_SREC_e	recordType;
	EXITCODE_e exitCode = EXITCODE_NORMAL;

	if ((pDst == NULL) | (bytesWritten == NULL))
	{
		exitCode = EXITCODE_NULL_PTR;
	}
	else
	{
		while (fgets(line, INPUT_LINE_LEN, fileName) != NULL)
		{
			lineCtr++;
			if (line[0] == MOT_SREC_IDENT)
			{   /* check record type */
				recordType = line[1] - ASCII_0 ;
				if (((recordType >= MOT_SREC__DATA16) && (recordType <= MOT_SREC__DATA32)) || 
					((recordType >= MOT_SREC__EOB32)  && (recordType <= MOT_SREC__EOB16)))
				{
					exitCode = hexdigitsToInt(line[2], line[3], &dataCnt);
					if (exitCode == EXITCODE_HEXCHAR_CONVERTION)
					{
						hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
						break;
					}
					else {}
					checkSum = dataCnt;
					adr = 0;
					mulFak = 0;
					offset = 8;
					switch (recordType)
					{
						case MOT_SREC__DATA32: /* 32 bit address */
						case MOT_SREC__EOB32:  /* fall though */
							exitCode = hexdigitsToInt(line[10], line[11], &x);
							if (exitCode == EXITCODE_HEXCHAR_CONVERTION)
							{
								hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
								break;
							}
							else {}
							checkSum += x;
							adr += (x << mulFak);
							dataCnt--;
							mulFak += 8;
							offset += 2;	/* due to 32bit adr */
							/* no break here !! */
						case MOT_SREC__DATA24: /* 24 bit address */
						case MOT_SREC__EOB24:  /* fall though */
							exitCode = hexdigitsToInt(line[8], line[9], &x);
							if (exitCode == EXITCODE_HEXCHAR_CONVERTION)
							{
								hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
								break;
							}
							else {}
							checkSum += x;
							adr += (x << mulFak);
							dataCnt--;
							mulFak += 8;
							offset += 2; /* due to 24bit adr */
							/* no break here !! */
						case MOT_SREC__DATA16: /* 16 bit address */
						case MOT_SREC__EOB16:  /* fall though */
							exitCode = hexdigitsToInt(line[6], line[7], &x);
							if (exitCode == EXITCODE_HEXCHAR_CONVERTION)
							{
								hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
								break;
							}
							else {}
							checkSum += x;
							adr += (x << mulFak);
							mulFak += 8;
							exitCode = hexdigitsToInt(line[4], line[5], &x);
							if (exitCode == EXITCODE_HEXCHAR_CONVERTION)
							{
								hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
								break;
							}
							else {}
							checkSum += x;
							adr += (x << mulFak);
							dataCnt -= 3;
							if ((adr + dataCnt) >= dstSize)
							{
								exitCode = EXITCODE_ADDRESS_OUT_OF_RANGE;
								break;
							}
							for (i = 0; i < dataCnt; i++)
							{
								exitCode = hexdigitsToInt(line[2 * i + offset], line[2 * i + offset + 1], &x );
								if (exitCode == EXITCODE_HEXCHAR_CONVERTION)
								{
									hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
									break;
								}
								else {}
								checkSum += x;
								*(pDst + adr + i) = (uint8_t) x;
							}
							if (dataCntTotal < adr + dataCnt)
							{  /* store the biggest written (address + 1) here */
								dataCntTotal = adr + dataCnt;
							}
							else {}

							/* return the current count of written bytes */
							break;
						default:
							exitCode = EXITCODE_WRONG_RECORD_TYPE;
							hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
							break;
					} // switch ()

					if (exitCode != EXITCODE_NORMAL)
					{
						break;
					}
					else {}
					/* check if record is valid */
					exitCode = hexdigitsToInt(line[2 * dataCnt + offset], line[2 * dataCnt + offset + 1], &x );
					if (exitCode == EXITCODE_HEXCHAR_CONVERTION)
					{	
						hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
						break;
					}
					else {}
					checkSum += x;
					checkSum &= 0xff;
					if (checkSum != 0xff)
					{
						exitCode = EXITCODE_CHECKSUM_ERROR;
						hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
						break;
					}
					else {}
				}
				else
				{
					if ((recordType == MOT_SREC__BLOCK_HEADER) || 
						(recordType == MOT_SREC__BLOCK_COUNT))
					{
						/* skip these record types */
					}
					else
					{
						exitCode = EXITCODE_NO_DATA_CNTR;
						hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
						break;
					}
				}
			}
			else
			{
				exitCode = EXITCODE_UNVALID_FIRST_CHAR;
				hexToBin_Debug(exitCode, LogLevel_Fatal, __LINE__);
				break;

			}
		}   /* while () */
		*bytesWritten = dataCntTotal;
    }

	return (exitCode);
}

/*-----------------------------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
EXITCODE_e				/* see enum definition of exit code */
bin2Mot
( MOT_SREC_e srec       /**< [IN]  identifies the record type to create */
, uint8_t    *pSrc      /**< [IN]  ptr to source data in binary buffer  */
, uint8_t    srcSize    /**< [IN]  number of bytes in data block */
, sc8_t      *pDst	    /**< [OUT] ptr to line buffer */
, uint_t     startAddr  /**< [IN]  start address of S-Record, addr width from srec format (16/24/32bit) */
)
{
	sint_t      i;
	sc8_t       *pWrite = NULL; // write pointer for line buffer
	uint8_t     *pRead = NULL;  // read pointer from source buffer
	uint_t      byteCount;      // dummy, will overwritten later
	uint_t      addrWidthInByte = 0;
	uint32_t    addrValue = 0;
	uint8_t     u8 = 0;
	uint_t      checkSum = 0;
	EXITCODE_e  exitCode = EXITCODE_NORMAL;
    
	pWrite = pDst;
	pRead = pSrc;
	if ((pWrite == NULL) || ((pRead == NULL) && ((srec == MOT_SREC__DATA16) || (srec == MOT_SREC__DATA24)|| (srec == MOT_SREC__DATA32))))
	{
		exitCode = EXITCODE_NULL_PTR;
	}
	else
	{
		switch (srec)
		{
			case MOT_SREC__BLOCK_HEADER:
				addrValue = startAddr;
				addrWidthInByte = WIDTH_ADDR_16BIT;
				byteCount = WIDTH_CHECKSUM + addrWidthInByte + srcSize;
			break;
			case MOT_SREC__DATA16:
				addrValue = startAddr;
				addrWidthInByte = WIDTH_ADDR_16BIT;
				byteCount = WIDTH_CHECKSUM + addrWidthInByte + srcSize;
			break;
			case MOT_SREC__DATA24:
				addrValue = startAddr;
				addrWidthInByte = WIDTH_ADDR_24BIT;
				byteCount = WIDTH_CHECKSUM + addrWidthInByte + srcSize;
			break;
			case MOT_SREC__DATA32:
				addrValue = startAddr;
				addrWidthInByte = WIDTH_ADDR_32BIT;
				byteCount = WIDTH_CHECKSUM + addrWidthInByte + srcSize;
			break;		
			case MOT_SREC__BLOCK_COUNT:
				addrValue = srcSize;        // content is part of 16bit address field
				addrWidthInByte = WIDTH_ADDR_16BIT;
				byteCount = WIDTH_CHECKSUM + addrWidthInByte;
			break;
			case MOT_SREC__EOB32:
				addrValue = 0;
				addrWidthInByte = WIDTH_ADDR_32BIT;
				byteCount = WIDTH_CHECKSUM + addrWidthInByte;
			break;
			case MOT_SREC__EOB24:
				addrValue = 0;
				addrWidthInByte = WIDTH_ADDR_24BIT;
				byteCount = WIDTH_CHECKSUM + addrWidthInByte;
			break;
			case MOT_SREC__EOB16:
				addrValue = 0;
				addrWidthInByte = WIDTH_ADDR_16BIT;
				byteCount = WIDTH_CHECKSUM + addrWidthInByte;
			break;
			default:
				addrValue = 0;
				addrWidthInByte = 0;
				byteCount = 0;
			break;
		}

		if (byteCount == 0)
		{	// error, prepare empty line
			*pWrite++ = ASCII_NUL;
		}
		else
		{
			*pWrite++ = MOT_SREC_IDENT;
			*pWrite++ = ASCII_0 + (sc8_t) srec;
			checkSum = 0;
			// write checksum
			if (byteCount > 255)
			{
				exitCode = EXITCODE_BYTE_CNT_OVERFLOW;
			}
			else
			{
				uint8ToHexdigits((uint8_t) byteCount, pWrite);
				pWrite += 2;
				checkSum += byteCount;
				// write addr value
				for (i = (addrWidthInByte - 1); i >= 0 ; i--)
				{
					u8 = (uint8_t) ((addrValue >> (i * 8)) & 0x000000FFu);
					checkSum += u8;
					uint8ToHexdigits(u8, pWrite);
					pWrite += 2;
				}
				// write data block if necessary
				for (i = 0; i < (sint_t) srcSize; i++)
				{
					u8 = *pRead++;
					checkSum += u8;
					uint8ToHexdigits(u8, pWrite);
					pWrite += 2;
				}
				// calc complement of checksum before writing it
				u8 = (uint8_t) checkSum;
				u8 ^= 0xFF;
				uint8ToHexdigits(u8, pWrite);
				pWrite += 2;
				// write EOL character  
				*pWrite++ = ASCII_LF;
				*pWrite++ = ASCII_NUL;
			}
		}
	}
    return (exitCode);
}