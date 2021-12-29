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
 *  ANSI C Prototypes for KTO projects
 *  date        author  reason
 *  09.01.2012  KTO     V1.0.0.0
 *  13.02.2012  KTO     V1.0.1.0
 *  25.02.2012  KTO     V1.0.2.0
  */
 
#ifndef _KTO_TYPES_H_
#define _KTO_TYPES_H_

#define	TRUE		        1
#define	FALSE               0

// #define NULL                ((void *)0) // normally already part of <stdio.h>

#ifndef __cplusplus

typedef enum
{
    false,
    true
} bool_e;

typedef bool_e              bool_t;

#else   /* #ifndef __cplusplus */
typedef bool                bool_t;
#endif  /* #ifndef __cplusplus */


typedef signed char		    sint8_t;
typedef unsigned char       uint8_t;

typedef signed short        sint16_t;
typedef unsigned short      uint16_t;

typedef signed long         sint32_t;
typedef unsigned long       uint32_t;

typedef signed long long    sint64_t;
typedef unsigned long long  uint64_t;


typedef signed int          sint_t;
typedef unsigned int	    uint_t;

typedef char                sc8_t;
typedef unsigned char       uc8_t;


#endif	/* _KTO_TYPES_H_ */
