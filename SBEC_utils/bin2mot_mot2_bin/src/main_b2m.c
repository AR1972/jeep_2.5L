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
Syntax: BIN2MOT [/option] binfile [motfile]

binfile is the binary input file
motfile is the Motorola S Record file to create

option  may be any of the following

  /Ln     Bytes to read from binary file
  /In     Binary file starting offset
  /On     Output file address offset (where S-Record data starts)
  /M      Merge data into existing Motorola file (not supported because writing to an existing file)
  /2      Generate S2/S8 records
  /3      Generate S3/S7 records
  /H      Exclude S0 header record
  /T      Exclude S8/S9 trailer record
  /A      Append new data to end of existing Motorola file
  /Q      Quiet mode (no statistics are displayed)

  /?      This help text
##################################################################
 *  date        author  reason
 *  09.01.2012  KTO     V1.0.0.0
 *  13.02.2012  KTO     V1.0.1.0
 *  25.02.2012  KTO     V1.0.2.0
 *
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "kto_types.h"
#include "logging.h"
#include "MotBinBinMot.h"


#define VERSION_INFO        0x01000300UL	/* => V1.0.3.0 */

#ifdef NDEBUG
    #define VERSION_STR     "release"
#else
    #define VERSION_STR     "debug"
#endif


#define MAX_BUFFER_SIZE     (1024*1024)
#define MAX_ARGLENGTH       0x40    /*  max. length of a argument */
#define MAX_ARGS            10      /* */
#define FILENAME_SIZE       0xFF

#define ASC_PARAM_OPTION    '-'
#define ASC_PARAM_DOSWIN    '/'
#define ASC_DELIM           '.'
#define ASC_NUL             '\0'

#define CNF_OUTFILE_EXT         ".mot"
#define CNF_SREC_IDENT_STR      "bin2mot (KTO)"
#define CNF_DATABYTES_PER_SREC  16

typedef enum
{
    Error_Free,
    Error_UnsupportedFiletype,
    Error_WrongNumberOfParameter,
    Error_HexConversion,
    
    Error_CantOpenInputfile,
    Error_CantWriteBinfile,
    Error_CantOpenOutfile,
    Error_FseekProblem,
    
    Error_UnsupportedParameter,
    Error_NotEnoughMemoryAvailable,
    Error_NoValidDebugLevel,
    Error_MallocReturnsNull,
    
    Error_AddressOffset,
    Error_NoValidBinfileSize,
    Error_NoValidBinfileOffset,
    Error_NoValidMotfileOffset,

    Error_LastEntry

} Error_e;


/* CURRENTLY UNUSED
 * this enum enumerates the struct param_s
 * this simplifies to find occurence during parsing command line parameter
 *
 
typedef enum
{
    Param_binSize               = 0,
    Param_binOffset             = 1,
    Param_motOffset             = 2,
    Param_mergeToMotfile        = 3,
    Param_genRecordS2S8         = 4,
    Param_genRecordS3S9         = 5,
    Param_exclRecordHdrS0       = 6,
    Param_exclRecordTrailS8S9   = 7,
    Param_appendData2Hexfile    = 8,
    Param_isQuietMode           = 9,
    Param_printHelp             = 10,
	
	Param_lastEntry             = 11

} Param_e;

typedef struct
{
	uint_t	  value;
    sc8_t	  cmdLineOption[2][3];

} paramEntry_s;
*/


typedef struct
{
	uint_t      binSize;              // -Ln    Bytes to read from binary file
    uint_t      binOffset;            // -In    Binary file starting offset
    uint_t	    motOffset;            // -On    Output file address offset (where S-Record data starts)
    uint_t      mergeToMotfile;       // -M     Merge data into existing Motorola file
    uint_t      genRecordS2S8;        // -2     Generate S2/S8 records
    uint_t      genRecordS3S9;        // -3     Generate S3/S7 records
    uint_t      exclRecordHdrS0;      // -H     Exclude S0 header record
    uint_t      exclRecordTrailS8S9;  // -T     Exclude S8/S9 trailer record
    uint_t      appendData2Hexfile;   // -A     Append new data to end of existing Motorola file
    uint_t      isQuietMode;          // -Q     Quiet mode (no statistics are displayed)
    uint_t      printHelp;            // -?     print this help text to stdout
                                      // --help print this help text to stdout
} Param_s;


FILE            *inFile, *outFile;
sc8_t           argBuffer[MAX_ARGLENGTH];
uint8_t         *pDataBuf;      /* ptr to data */
LogLevel_e      gblLogLevel;    /* global variable needed to avoid compiler warning */
sc8_t			filenameOut[FILENAME_SIZE], filenameInp[FILENAME_SIZE];
sc8_t           *s, *str;

Param_s         param = { 0         /* value of padding data */
                        , 0         /* length of binary file */
                        , 0         /* offset of hexa file */
                        , FALSE     /* merge into existing binary file */
                        , FALSE     /* gen. S2/S8 records */
                        , FALSE     /* gen. S3/S9 records */
                        , FALSE     /* exclude Header record S0 */
                        , FALSE     /* exclude Trailer record S7/S8/S9 */
                        , FALSE     /* append data at end of hexfile */
                        , FALSE     /* no detailed printf output */
                        , FALSE     /* print help message */
                        };

static const char *errorStr[] = 
{
    "ERROR_FREE",
    "ERROR_UNSUPPORTED_FILETYPE",
    "ERROR_WRONG_NUMBER_OF_PARAMETER",
    "ERROR_HEX_CONVERSION",
    
    "ERROR_CANT_OPEN_INPFILE",
    "ERROR_CANT_WRITE_BINFILE",
    "ERROR_CANT_OPEN_OUTFILE",
    "ERROR_FSEEK_PROBLEM",
    
    "ERROR_UNSUPPORTED_PARAMETER",
    "ERROR_NOT_ENOUGH_RAM_AVAILABLE",
    "ERROR_NO_VALID_DEBUG_LEVEL",
    "ERROR_MALLOC_RETURNS_NULL",
    
    "ERROR_ADDRESS_OFFSET",
    "ERROR_NO_VALID_BINFILE_LENGTH",
    "ERROR_NO_VALID_BINFILE_OFFSET",
    "ERROR_NO_VALID_HEXFILE_OFFSET",

    "ERROR_LAST_ENTRY"
};

/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

sc8_t *versionStr(uint32_t vs)
{
	static sc8_t str[32];

	sprintf( str
		   , "%ld.%ld.%ld.%ld"
		   , 0xFF & (vs >> 24)
		   , 0xFF & (vs >> 16)
		   , 0xFF & (vs >> 8)
		   , 0xFF & vs
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
    printf( "\nbinary->motorola S-record converter V%s, by KTO  %s, %s\n"
		  , versionStr(VERSION_INFO), __DATE__, __TIME__);
}

void msgUsage(void)
{
    printf("\nUsage: bin2mot -Lnnn -Innn -Onnn -M -2 -3 -H -T -A -Q <binfile> [motfile]\n");
    printf(" default values: [] \n");
    printf(" -Ln  Bytes to read from binary file [0x0000]\n");
    printf(" -In  Binary file starting offset    [0x0000]\n");
    printf(" -On  Output file address offset     [0x0000] (where S-Record data starts)\n");
    printf(" -M   Merge data into existing Motorola file\n (not supp.)");
    printf(" -2   Generate S2/S8 records\n");
    printf(" -3   Generate S3/S7 records\n");
    printf(" -H   Exclude S0 header record\n");
    printf(" -T   Exclude S7/S8/S9 trailer record\n");
    printf(" -A   Append new data to end of existing Motorola file\n");
    printf(" -Q   Quiet mode (no statistics are displayed)\n");
    printf(" -?   This help text\n");
    printf(" <binfile> of input data stream\n");
    printf(" if no [motfile] is given, <binfile>.mot is used for motorola outputfile\n\n");
}

/* ************************************************************************* */
Error_e parseCmdLine(sint_t parCount, sc8_t *parVek[])
{
	sint_t	i = 0;
	Error_e	err = Error_Free;

	while (err == Error_Free)
    {
        if (!((parCount > 1) && (parCount <= MAX_ARGS)))
        {
            msgUsage();
            err = Error_WrongNumberOfParameter;
            break;
        }
        else {}

        strncpy(filenameOut, parVek[parCount - 1], FILENAME_SIZE);    /* last argument must be a filename */
        strncpy(filenameInp, parVek[parCount - 2], FILENAME_SIZE);    /* second before last argument can be a filename */
        
		if ((filenameOut[0] == ASC_PARAM_OPTION) ||
			(filenameOut[0] == ASC_PARAM_DOSWIN))
		{
			param.printHelp = TRUE;
			break;
		}
		else
		{
			if ((filenameInp[0] == ASC_PARAM_OPTION) ||
		        (filenameInp[0] == ASC_PARAM_DOSWIN) ||
				 (parCount == 2))
			{ 
				/* filenameInp is a param and not a filename
				* to do: create filename of outfile from inputfile
				* - copy name of outfile to inputfile
				* - add extension of filename to ".mot"
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

			for (i = 1; (i < parCount - 1) && (err == Error_Free); i++)
			{
				str = prepareArgument(parVek[i]);

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
					if ((strlen(s) == 2) || (sscanf(s, "%X", &param.binSize) == EOF))
					{
						err = Error_NoValidBinfileSize;
						break;
					}
					else {}

					if (param.binSize > MAX_BUFFER_SIZE)
					{
						err = Error_NoValidBinfileSize;
						break;
					}
					else {}
				}
				else {}


				if ((s = strstr(str, "-I")) == NULL)
				{
					#ifndef __linux__
					s = strstr(str, "/I");
					#endif
				}
				else {}
				if (s != NULL)
				{
					s += 2;
					if ((strlen(s) == 2) || (sscanf(s, "%X", &param.binOffset) == EOF))
					{
						err = Error_NoValidBinfileOffset;
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
					if ((strlen(s) == 2) || (sscanf(s, "%X", &param.motOffset) == EOF))
					{
						err = Error_NoValidMotfileOffset;
						break;
					}
					else {}
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
					param.mergeToMotfile = TRUE;
					break;
				}
				else {}


				if ((s = strstr(str, "-2")) == NULL)
				{
					#ifndef __linux__
					s = strstr(str, "/2");
					#endif
				}
				else {}
				if (s != NULL)
				{
					param.genRecordS2S8 = TRUE;
				}
				else {}

	            
				if ((s = strstr(str, "-3")) == NULL)
				{
					#ifndef __linux__
					s = strstr(str, "/3");
					#endif
				}
				else {}
				if (s != NULL)
				{
					param.genRecordS3S9 = TRUE;
				}
				else {}
	            
	            
				if ((s = strstr(str, "-H")) == NULL)
				{
					#ifndef __linux__
					s = strstr(str, "/H");
					#endif
				}
				else {}
				if (s != NULL)
				{
					param.exclRecordHdrS0 = TRUE;
				}
				else {}


				if ((s = strstr(str, "-T")) == NULL)
				{
					#ifndef __linux__
					s = strstr(str, "/T");
					#endif
				}
				else {}
				if (s != NULL)
				{
					param.exclRecordTrailS8S9 = TRUE;
				}
				else {}

				if ((s = strstr(str, "-A")) == NULL)
				{
					#ifndef __linux__
					s = strstr(str, "/A");
					#endif
				}
				else {}
				if (s != NULL)
				{
					param.appendData2Hexfile = TRUE;
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

			}   /* for (... ) */
		}
		break; // always break to escape !!
    }   // while ...

	return (err);
}


/* ************************************************************************* */

sint_t main(sint_t argc, sc8_t *argv[])
{
    sint_t      i;
    MOT_SREC_e  sRecTypeData;   /* contains the selected data record type from cmd line */
	MOT_SREC_e  sRecTypeEob;    /* contains the end of block record related to data record */
    Error_e     error;
    sc8_t       lineBuf[LINE_BUF_SIZE];	/* all characters are inside ASCII 7-bit range */
        
#ifdef _DEBUG
    gblLogLevel = LogLevel_Debug;   
#else
    gblLogLevel = LogLevel_Info;
#endif

    msgInfo();

    error    = Error_Free;
    pDataBuf = NULL;

    if (LOG_LEVEL(LogLevel_Debug))
    {
        for (i = 0; i < argc; i++)
        {
            printf("Par%d: %s\n", i, argv[i]);
        }
    }
    else {}

	error = parseCmdLine(argc, argv);

    
/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
    if ((error == Error_Free) && (param.printHelp))
    {
         msgUsage();
    }
    else
    {
        while (error == Error_Free)
        {
            if (param.mergeToMotfile)
            {
                error = Error_UnsupportedParameter;
                break;
            }

            pDataBuf = (uint8_t *) malloc(MAX_BUFFER_SIZE);
            if (pDataBuf == NULL)
            {
                error = Error_MallocReturnsNull;
                break;
            }
            memset(pDataBuf, 0, MAX_BUFFER_SIZE); /* set complete buffer to default */

            if ((inFile = fopen(filenameInp,"rb")) == NULL)
            {
                error = Error_CantOpenInputfile;
                break;
            }
            else
            {   /* set filepointer to given binary offset */
                if (fseek(inFile, param.binOffset, SEEK_SET) != 0) 
				{
					error = Error_FseekProblem;
					break;
				};
                /* read number of bytes given from cmdline */
                fread(pDataBuf, sizeof(uint8_t), param.binSize, inFile);
                fclose(inFile);
            }

            if ((outFile = fopen(filenameOut, (param.appendData2Hexfile) ? "a+" : "w+")) == NULL)
            {
                error = Error_CantOpenOutfile;
                break;
            }
            else
            {   /* write header (S0) record if requested */
                uint32_t    addr = 0; /* addr of S0 record is always at 0 */
                sint_t      numOfSRecBlocks = 0;
                sint_t      numOfRestBytes = 0;
                uint8_t     *pRead = pDataBuf; /* read pointer starts at begin of binary buffer */
                if (!param.exclRecordHdrS0)
                {
                    bin2Mot( MOT_SREC__BLOCK_HEADER
                           , (uint8_t *) CNF_SREC_IDENT_STR
                           , (uint8_t) strlen(CNF_SREC_IDENT_STR)
                           , lineBuf
                           , addr);
                    fputs(lineBuf, outFile);
                }

                addr = 0; 
                if (param.genRecordS2S8) 
                { 
                    sRecTypeData = MOT_SREC__DATA24; 
                    sRecTypeEob  = MOT_SREC__EOB24;
                }
                else if (param.genRecordS3S9) 
                {
                    sRecTypeData = MOT_SREC__DATA32;
                    sRecTypeEob  = MOT_SREC__EOB32;
                }
                else 
                { 
                    sRecTypeData = MOT_SREC__DATA16;
                    sRecTypeEob  = MOT_SREC__EOB16;
                }

                numOfSRecBlocks = param.binSize / CNF_DATABYTES_PER_SREC;
                numOfRestBytes  = param.binSize % CNF_DATABYTES_PER_SREC;
				/* write 'numOfSRecBlocks' CNF_DATABYTES_PER_SREC blocks to stream */
                for (i = 0; i < numOfSRecBlocks; i++)
                {
                    bin2Mot( sRecTypeData
                            , pRead
                            , CNF_DATABYTES_PER_SREC
                            , lineBuf
                            , addr + param.motOffset);
                    fputs(lineBuf, outFile);
                    addr  += CNF_DATABYTES_PER_SREC;
                    pRead += CNF_DATABYTES_PER_SREC;
                }
				/* check if a rest shall although be written ... */
				if (numOfRestBytes != 0)
				{
					bin2Mot( sRecTypeData
                             , pRead
                             , (uint8_t) numOfRestBytes
                             , lineBuf
                             , addr + param.motOffset);
					fputs(lineBuf, outFile);
				}
				// do we need an 'end of block' record?
                if (!param.exclRecordTrailS8S9)
                {
                    bin2Mot( sRecTypeEob
                            , NULL
                            , 0
                            , lineBuf
                            , 0);
                    fputs(lineBuf, outFile);
                }

                fclose(outFile);
            }

            if (!param.isQuietMode && LOG_LEVEL(LogLevel_Info))
            {
                printf( "\n content of %s written to %s\n"
					  , filenameInp, filenameOut);
            }
            else {}

            break; /* always break to escape !! */
		} /* while (error == NO_ERROR) */
    } /* else */

    if (error != Error_Free)
    {
        printf("\nerror %d has occured: %s\n", error, errorStr[error]);
        /* getchar();  inserted for easier error recognition */
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
