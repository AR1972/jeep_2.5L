#include <stdio.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>
#include <io.h>

char buf[65536];
unsigned int pos;
int rdcnt;
int srcfile, tgtfile;

int main(int argc, char *argv[])
{
	if (argc != 3) {
		fprintf(stderr, "Usage : 32k src_file trgt_file\n");
		return(1);
	}

	if ((srcfile = _open(argv[1], (O_BINARY | O_RDONLY))) == -1) {
		fprintf(stderr, "Error opening %s\n", argv[1]);
		return(1);
	}

	rdcnt = _read(srcfile, buf, 2);
	if (rdcnt != 2) {
		fprintf(stderr, "Can't read %s\n", argv[1]);
		return(1);
	}

	rdcnt = 32768;

	pos = _lseek(srcfile, 0L, SEEK_END);
	if (65536 != pos) {
		fprintf(stderr, "File too short or improper format.\n");
		return(1);
	}

	_lseek(srcfile, 32768, SEEK_SET);

	if ((tgtfile = _open(argv[2], (O_BINARY | O_WRONLY | O_CREAT | O_TRUNC),
		(S_IREAD | S_IWRITE))) == -1) {
		printf("Error creating %s\n", argv[2]);
		_close(srcfile);
		return(1);
	}

	while ((rdcnt = _read(srcfile, buf, sizeof buf)) > 0)
		_write(tgtfile, buf, rdcnt);

	_close(srcfile);
	_close(tgtfile);

	return(0);
}

