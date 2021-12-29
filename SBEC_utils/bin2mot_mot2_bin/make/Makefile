# Makefile for BinMotConv project
# - adapted for Linux: 12-mar-2012, KTO
# - builds both executables in one run (bin2mot, mot2bin)
#
# set here external include paths
MAKE2ROOT = ..
INC_PATH = $(MAKE2ROOT)/src
SRC_PATH = $(MAKE2ROOT)/src
BIN_PATH = $(MAKE2ROOT)/bin

# Debugging Flags enabled (-g)
# All Warnings enabled (-Wall)
# CC=$(CROSS_COMPILE)gcc 
# settings => for gcc
COPY = cp
CC = gcc
CFLAGS = -c -g -Wall -I$(SRC_PATH) -I$(INC_PATH) -DNDEBUG

# where to look for files for dependencies 
vpath %.c $(SRC_PATH)
vpath %.h $(SRC_PATH) $(INC_PATH)
# vpath %.o obj
 
OBJS = \
main_b2m.o \
main_m2b.o \
MotBinBinMot.o


# Rules
# First dependency must be the .c File
#
# Example:
# Make looks for bs_check: bs_check.o as default to build bs_check, so
# it is not necessary to include this dependency. But it is
# necessary to set the rule how to build the obj file!
# Try the command "make bs_check"
# 
# $<: set to the name of the first dependecy so e.g. src/bs_check.c
# $@: The file name of the target of the rule e.g. obj/bs_scheck.o


all: bin2mot mot2bin

# ........ linker part ...............#
bin2mot: $(OBJS) Makefile
	$(CC) $(LDFLAGS) -o $@ MotBinBinMot.o main_b2m.o
	$(COPY) $@ $(BIN_PATH)/$@
	@echo "$@ program ready\n" 

mot2bin: $(OBJS) Makefile
	$(CC) $(LDFLAGS) -o $@ MotBinBinMot.o main_m2b.o
	$(COPY) $@ $(BIN_PATH)/$@
	@echo "$@ program ready\n"

#........ compiler part ............. #
main_m2b.o: main_m2b.c logging.h kto_types.h Makefile 
	$(CC) $(CFLAGS) $< -o $@
	@echo "$< build done\n"
	
main_b2m.o: main_b2m.c logging.h kto_types.h MotBinBinMot.h Makefile 
	$(CC) $(CFLAGS) $< -o $@
	@echo "$< build done\n"
	
MotBinBinMot.o: MotBinBinMot.c logging.h kto_types.h MotBinBinMot.h Makefile
	$(CC) $(CFLAGS) $< -o $@
	@echo "$< build done\n"

#......... cleanup ...................#
clean: Makefile
	rm -f  main_b2m.o main_m2b.o MotBinBinMot.o bin2mot mot2bin
