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

#ifndef _MOTBINBINMOT_H_
#define _MOTBINBINMOT_H_

#include <stdio.h>
#include "kto_types.h"


#define LINE_BUF_SIZE       0x210u	// recommended buffer size of one s-record line

#if 0
#define INTEL_REC_IDENT     ':'	// intel hex file, all formats
// --- Intel Hex Record Types ---
typedef enum
{
	INTEL_REC__DATA                      = 0,
	INTEL_REC__END_OF_FILE               = 1,
	INTEL_REC__EXTENDED_SEGMENT_ADDRESS  = 2,
	INTEL_REC__START_SEGMENT_ADDRESS     = 3,
	INTEL_REC__EXTENDED_LINEAR_ADDRESS   = 4,
	INTEL_REC__START_LINEAR_ADDRESS      = 5

} INTEL_REC_e;
#endif

// --- Motorola S-Record Identifier ---
#define MOT_SREC_IDENT      'S'  // all records

// --- Motorola S-Record Types ---
typedef enum
{
    MOT_SREC__BLOCK_HEADER  = 0,

	MOT_SREC__DATA16        = 1,
    MOT_SREC__DATA24        = 2,
    MOT_SREC__DATA32        = 3,

    MOT_SREC__BLOCK_COUNT   = 5,

    MOT_SREC__EOB32         = 7,
    MOT_SREC__EOB24         = 8,
    MOT_SREC__EOB16         = 9

} MOT_SREC_e;


typedef enum
{
    EXITCODE_NORMAL	                 = 0,
    EXITCODE_WRONG_RECORD_TYPE       = 1,
    EXITCODE_CHECKSUM_ERROR          = 2,
    EXITCODE_NULL_PTR                = 3,
    EXITCODE_UNVALID_FIRST_CHAR      = 4,
    EXITCODE_BYTE_CNT_OVERFLOW       = 5,
    EXITCODE_UNSUPPORTED_HEX_TYPE    = 6,
    EXITCODE_ADDRESS_RANGE_VIOLATION = 7,
    EXITCODE_ADDRESS_OUT_OF_RANGE    = 8,
    EXITCODE_HEXCHAR_CONVERTION      = 9,
	EXITCODE_FPUTS_PROBLEM	 		 = 10,
	EXITCODE_FGETS_PROBLEM	 		 = 11,
	EXITCODE_NO_DATA_CNTR			 = 12

} EXITCODE_e;

/* \brief converts binary data to one mototrola s-record line
 *  The main program has to control the split of source data into several 
 *  calls of this function. It has although to provide the required record 
 *  type.
 */

EXITCODE_e				/* see enum definition of exit code */
bin2Mot
( MOT_SREC_e srec       /**< [IN]  identifies the record type to create */
, uint8_t    *pSrc      /**< [IN]  ptr to source data in binary buffer  */
, uint8_t    srcSize    /**< [IN]  number of bytes in data block */
, sc8_t      *pDst	    /**< [OUT] ptr to line buffer */
, uint_t     startAddr  /**< [IN]  start address of S-Record, addr width from srec format (16/24/32bit) */
);

/* \brief converts binary data to one mototrola s-record line
 *  The main program has to control the split of source data into several 
 *  calls of this function. It has although to provide the required record 
 *  type.
 */
EXITCODE_e                  /* see enum definition of exit code */
mot2Bin
( FILE		*fileName       /**< [IN]  ptr to file to read from */
, uint8_t	*pDst           /**< [OUT] ptr to binary buffer */
, uint_t	dstSize         /**< [IN]  size of buffer */
, uint_t    *bytesWritten   /**< [IN]  number of written bytes to binary file */
);
                        
#endif	/* _MOTBINBINMOT_H_ */
