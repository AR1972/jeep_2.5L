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

/*
##################################################################
Syntax: MOT2BIN [/option] motfile [binfile]

motfile is the Motorola S Record input file
binfile is the binary file to create

option  may be any of the following

  /Ln     Binary file length
  /Pn     Pad data for binary file
  /On     Address offset (to add to Motorola records)
  /M      Merge data into existing BIN file
  /Q      Quiet mode (no statistics are displayed)

  /?      This help text
##################################################################

 *  date        author	version   reason
 *  07-feb-2012 KTO     V1.0.0.0  creation
 *  14-feb-2012 KTO     V1.0.1.0  change to reworked converter functions
 *  25-feb-2012 KTO     V1.0.2.0  distinguish bewteen LINUX and DOS compiler option notation
 *  05-mar-2012 KTO     V1.0.3.0  fix bug with number of written bytes in mot2bin() call
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "kto_types.h"
#include "logging.h"
#include "MotBinBinMot.h"

#define VERSION_INFO        0x01000300UL

#ifdef NDEBUG
	#define VERSION_STR     "release"
#else
	#define VERSION_STR     "debug"
#endif


#define MAX_BUFFER_SIZE     (1024*1024)
#define MAX_ARGLENGTH       0x40    /*  max. length of a argument */
#define MAX_ARGS            10      /* */
#define FILENAME_SIZE       0xFF

#define SHIFT_MASK_8BIT     0xFFul

#define ASC_PARAM_OPTION    '-'
#define ASC_PARAM_DOSWIN    '/'
#define ASC_DELIM           '.'
#define ASC_NUL             '\0'

#define CNF_OUTFILE_EXT         ".bin"
#define CNF_SREC_IDENT_STR      "mot2bin (KTO)"

typedef enum
{
	ERROR_FREE,
	ERROR_UNSUPPORTED_FILETYPE,
	ERROR_WRONG_NUMBER_OF_PARAMETER,
	ERROR_HEX_CONVERSION,
	
    ERROR_CANT_OPEN_INPFILE,
	ERROR_CANT_WRITE_BINFILE,
    ERROR_CANT_OPEN_OUTFILE,
	ERROR_FSEEK_PROBLEM,
	
	ERROR_UNSUPPORTED_PARAMETER,
	ERROR_NOT_ENOUGH_RAM_AVAILABLE,
	ERROR_NO_VALID_DEBUG_LEVEL,
	ERROR_MALLOC_RETURNS_NULL,
	
	ERROR_ADDRESS_OFFSET,
	ERROR_NO_VALID_BINFILE_LENGTH,
    ERROR_NO_VALID_PAD_VALUE,
	ERROR_NO_VALID_HEXFILE_OFFSET,

	ERROR_LAST_ENTRY

} ErrorCode_e;

typedef struct
{
	uint8_t	padData;		// cmdline: value of pad byte
	uint_t	binLength;		// cmdline: length of binary file
	uint_t	hexaOffset;		// cmdline: offset of hexa file
	bool_t	mergeToBinfile; // cmdline: merge into existing binary file
	bool_t  printHelp;      // cmdline: print help text to stdout
	bool_t	isQuietMode;	// cmdline: no detailed output

} Param_s;

static const char *errorStr[] = 
{
	"ERROR_FREE",
	"ERROR_UNSUPPORTED_FILETYPE",
	"ERROR_WRONG_NUMBER_OF_PARAMETER",
	"ERROR_HEX_CONVERSION",

	"ERROR_CANT_OPEN_HEXFILE",
	"ERROR_CANT_WRITE_BINFILE",
	"ERROR_UNABLE_TO_OPEN_BINFILE",
	"ERROR_FSEEK_PROBLEM",

	"ERROR_UNSUPPORTED_PARAMETER",
	"ERROR_NOT_ENOUGH_RAM_AVAILABLE",
	"ERROR_NO_VALID_DEBUG_LEVEL",
	"ERROR_MALLOC_RETURNS_NULL",
	
	"ERROR_ADDRESS_OFFSET",
	"ERROR_NO_VALID_BINFILE_LENGTH",
	"ERROR_NO_VALID_PAD_VALUE",
	"ERROR_NO_VALID_HEXFILE_OFFSET",

	"ERROR_LAST_ENTRY"
};

FILE            *inFile, *outFile;
sc8_t           argBuffer[MAX_ARGLENGTH];
uint8_t         *pDataBuf;      /* ptr to data */
LogLevel_e      gblLogLevel;    /* global variable needed to avoid compiler warning */
sc8_t			filenameOut[FILENAME_SIZE], filenameInp[FILENAME_SIZE];
sc8_t           *s, *str;


/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

sc8_t *versionStr(uint32_t vs)
{
	static sc8_t str[32];

	sprintf( str
		   , "%ld.%ld.%ld.%ld"
		   , SHIFT_MASK_8BIT & (vs >> 24)
		   , SHIFT_MASK_8BIT & (vs >> 16)
		   , SHIFT_MASK_8BIT & (vs >> 8)
		   , SHIFT_MASK_8BIT & vs
		   );

	return (str);
}


sc8_t *prepareArgument(sc8_t *arg)
{
    sc8_t *ch;

	if (strlen(arg) < MAX_ARGLENGTH)
	{
		strcpy(argBuffer, arg);
		for (ch = argBuffer; *ch != '\0'; ch++)
		{
            *ch = (sc8_t) toupper(*ch);
		}
		ch = argBuffer;
	}
	else
	{
		ch = NULL;
	}

	return (ch);
}

/* ************************************************************************* */
void msgInfo(void)
{
	printf( "\nhexadecimal->binary converter %s, by KTO  %s, %s\n"
		  , versionStr(VERSION_INFO), __DATE__, __TIME__);
	printf(" converter for Motorola S-Record\n");
}

void msgUsage(void)
{
	printf("\nUsage: mot2bin -Lnnn -Pnnn -Onnn -M -Q <motfile> [binfile]\n");
	printf(" default values: [] \n");
	printf("   -> all numbers only in hexadecimal notation\n");
	printf(" -Ln  Binary file length [0x0000]\n");
	printf(" -Pn  Pad byte for binary file [0xFF]\n");
	printf(" -On  Address offset [0x0000] (to add to Motorola records)\n");
	printf(" -M   Merge data into existing binary file\n");
	printf(" -Q   Quiet mode (no statistics are displayed)\n");
	printf(" -?   This help text\n");
	printf(" <inputfile> of input data stream\n");
	printf(" if no [binfile] is given, <motfile>.bin\" is used for binary outputfile\n\n");
}

/* ************************************************************************* */

sint_t main(sint_t argc, sc8_t *argv[])
{
	ErrorCode_e	error;
	EXITCODE_e  exitCode = EXITCODE_NORMAL;
	//sint32_t	fileLength = 0;
	sc8_t		filenameOut[FILENAME_SIZE], filenameInp[FILENAME_SIZE];
	sint_t    	i;
	uint_t      bytesConv = 0;
	sc8_t		*s, *str;
	Param_s		param = { 0xff		/* value of padding data */
		                , 0			/* length of binary file */
						, 0			/* offset of hexa file */
						, FALSE		/* merge into existing binary file */
						, FALSE     /* print help message */
						, FALSE };	/* no detailed printf output */


#ifdef _DEBUG
	gblLogLevel = LogLevel_Debug;
#else
	gblLogLevel = LogLevel_Info;
#endif

	msgInfo();

	error = ERROR_FREE;
	pDataBuf = NULL;

	if (LOG_LEVEL(LogLevel_Debug))
	{
		for (i = 0; i < argc; i++)
		{
			printf("Par%d: %s\n", i, argv[i]);
		}
	}
	else {}

	while (error == ERROR_FREE)
	{
		if (!(argc > 1 && argc <= MAX_ARGS))
		{
			msgUsage();
			error = ERROR_WRONG_NUMBER_OF_PARAMETER;
			break;
		}
		else {}

		strncpy(filenameOut, argv[argc - 1], FILENAME_SIZE);	/* last argument must be a filename */
		strncpy(filenameInp, argv[argc - 2], FILENAME_SIZE);	/* second before last argument can be a filename */

		if ((filenameInp[0] == ASC_PARAM_OPTION) || 
			(filenameInp[0] == ASC_PARAM_DOSWIN) || 
			(argc == 2))
		{ 
			/* filenameInp is a param and not a filename
			 * to do: create filename of outfile from inputfile
			 * - copy name of outfile to inputfile
			 * - add extension of filename to ".bin"
			 */
			strncpy(filenameInp, filenameOut, FILENAME_SIZE);
			strcat(filenameOut, CNF_OUTFILE_EXT);
		}
		else {}

		if (LOG_LEVEL(LogLevel_Debug))
		{
			printf("InpFN:'%s'\n", filenameInp);
			printf("OutFN:'%s'\n", filenameOut);
		}
		else {}

		for (i = 1; (i < argc - 1) && (error == ERROR_FREE); i++)
		{
			str = prepareArgument(argv[i]);

			if ((s = strstr(str, "-L")) == NULL)
			{
				#ifndef __linux__
				s = strstr(str, "/L");
				#endif
			}
			else {}
			if (s != NULL)
			{
				s += 2;
				if ((strlen(s) == 2) || (sscanf(s, "%X", &param.binLength) == EOF))
				{
					error = ERROR_NO_VALID_BINFILE_LENGTH;
					break;
				}
				else {}

				if (param.binLength > MAX_BUFFER_SIZE)
				{
					error = ERROR_NO_VALID_BINFILE_LENGTH;
					break;
				}
				else {}
			}
			else {}

			if ((s = strstr(str, "-P")) == NULL)
			{
				#ifndef __linux__
				s = strstr(str, "/P");
				#endif
			}
			else {}
			if (s != NULL)
			{
				s += 2;
				if ((strlen(s) == 2) || (sscanf(s, "%X", (uint_t *) &param.padData) == EOF))
				{
					error = ERROR_NO_VALID_PAD_VALUE;
					break;
				}
				else {}
			}
			else {}

			if ((s = strstr(str, "-O")) == NULL)
			{
				#ifndef __linux__
				s = strstr(str, "/O");
				#endif
			}
			else {}
			if (s != NULL)
			{
				s += 2;
				if ((strlen(s) == 2) || (sscanf(s, "%X", &param.hexaOffset) == EOF))
				{
					error = ERROR_NO_VALID_HEXFILE_OFFSET;
					break;
				}
				else {}
			}
			else {}

			if ((s = strstr(str, "-Q")) == NULL)
			{
				#ifndef __linux__
				s = strstr(str, "/Q");
				#endif
			}
			else {}
			if (s != NULL)
			{
				param.isQuietMode = TRUE;
			}
			else {}


			if ((s = strstr(str, "-M")) == NULL)
			{
				#ifndef __linux__
				s = strstr(str, "/M");
				#endif
			}
			else {}
			if (s != NULL)
			{
				param.mergeToBinfile = TRUE;
			}
			else {}

			if ((s = strstr(str, "-?")) == NULL)
			{
				#ifndef __linux__
				s = strstr(str, "/?");
				#endif
			}
			else {}
			if (s != NULL)
			{
				param.printHelp = TRUE;
			}
			else {}

			if ((s = strstr(str, "--help")) != NULL)
			{
				param.printHelp = TRUE;
			}
			else {}

		}	/* for (... ) */

		break; // always break to escape !!
	}
	
/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
	if (param.printHelp)
	{
		 msgUsage();
		 error = ERROR_FREE;
	}
	else
	{
		while (error == ERROR_FREE)
		{
			if (param.binLength > MAX_BUFFER_SIZE)
			{
				error = ERROR_NOT_ENOUGH_RAM_AVAILABLE;
				break;
			}

			if (param.hexaOffset > 0)
			{
				error = ERROR_ADDRESS_OFFSET;
				break;
			}


			pDataBuf = (uint8_t*) malloc(MAX_BUFFER_SIZE);
			if (pDataBuf == NULL)
			{
				error = ERROR_MALLOC_RETURNS_NULL;
				break;
			}
			else {}

			memset(pDataBuf, param.padData, MAX_BUFFER_SIZE); // set complete buffer to pad byte

			if (param.mergeToBinfile)
			{	/* initalize the memory buffer with content of existing binary file */
				if ((inFile = fopen(filenameOut,"rb")) == NULL)
				{
					printf("WARNING: unable to open file %s. buffer content contains only pad bytes\n", filenameOut);
				}
				else
				{
					fread(pDataBuf, sizeof(uint8_t), MAX_BUFFER_SIZE, inFile);
					fclose(inFile);
				}
			}
			else {}

			if ((inFile = fopen(filenameInp,"r")) == NULL)
			{
				error = ERROR_CANT_OPEN_INPFILE;
				break;
			}
			else
			{	/* convert mot file to binary dataBuffer */
				exitCode = mot2Bin(inFile, pDataBuf, MAX_BUFFER_SIZE, &bytesConv);
				
				if (exitCode != EXITCODE_NORMAL)
				{
					error = ERROR_HEX_CONVERSION;
					break;
				}
				else {}
			}

			if ((outFile = fopen(filenameOut,"wb")) == NULL)
			{
				error = ERROR_CANT_WRITE_BINFILE;
				break;
			}
			else
			{	// write data buffer to binary file
				if ((bytesConv > param.binLength) && (param.binLength != 0))
				{
					// error data lost
				}
				else
				{
					if (param.binLength != 0)
					{   
						/* force binfile size to given param from cmd line */
						bytesConv = param.binLength;
					}
					else 
					{ 
						/* no given binfile size from cmd line, use bytes conv for file size */
					}
					fwrite(pDataBuf, sizeof(uint8_t), bytesConv, outFile);
					fclose(outFile);
				}
			}

			if (error != ERROR_FREE)
			{
				break; // while ()
			}
			else {}

			if (!param.isQuietMode && LOG_LEVEL(LogLevel_Info))
			{
                printf( "\n content of %s written to %s\n"
					  , filenameInp, filenameOut);
			}
			else {}

			break; // always break to escape !!
		} // while (error == NO_ERROR)
    } // else

    if (error != ERROR_FREE)
	{
		printf("\nerror %d has occured: %s\n", error, errorStr[error]);
		// getchar(); /* inserted for easier error recognition */
	}
	else {}

    #ifndef __linux__
    _fcloseall();               /* close all open files */
    #endif

    if (pDataBuf != NULL)       /* free the data buffer if allocated */
	{
        free((void *) pDataBuf);
		pDataBuf = NULL;
	}
	else {}

    return (error ? 1 : 0);     /* set the error level */
}
