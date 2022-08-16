#include "func.h"
#include "AS.H"
#include <stdio.h>
/*
* global variables
*/
int     Line_num = 0;             /* current line number                  */
int     Err_count = 0;            /* total number of errors               */
char    Line[MAXBUF] = { 0 };     /* input line buffer                    */
char    Label[MAXLAB] = { 0 };    /* label on current line                */
char    Op[MAXOP] = { 0 };        /* opcode mnemonic on current line      */
char    Operand[MAXBUF] = { 0 };  /* remainder of line after op           */
char    *Optr = 0;                /* pointer into current Operand field   */
int     Result = 0;               /* result of expression evaluation      */
int     Force_word = 0;           /* Result should be a word when set     */
int     Force_byte = 0;           /* Result should be a byte when set     */
int     Pc = 0;                   /* Program Counter                      */
int     Old_pc = 0;               /* Program Counter at beginning         */
int     Last_sym = 0;             /* result of last lookup                */
int     Pass = 0;                 /* Current pass #                       */
int     N_files = 0;              /* Number of files to assemble          */
FILE    *Fd = 0;                  /* Current input file structure         */
int     Cfn = 0;                  /* Current file number 1...n            */
int     Ffn = 0;                  /* forward ref file #                   */
int     F_ref = 0;                /* next line with forward ref           */
char    **Gargv = 0;              /* pointer to file names                */
int		E_total = 0;              /* total # bytes for one line           */
int		E_bytes[E_LIMIT] = { 0 }; /* Emitted held bytes                   */
int		E_pc = 0;                 /* Pc at beginning of collection        */
int     Lflag = 1;                /* listing flag 0=nolist, 1=list        */
int     P_force = 0;              /* force listing line to include Old_pc */
int     P_total = 0;              /* current number of bytes collected    */
int     P_bytes[P_LIMIT] = { 0 }; /* Bytes collected for listing          */
int     Cflag = 0;                /* cycle count flag                     */
int     Cycles = 0;               /* # of cycles per instruction          */
long    Ctotal = 0;               /* # of cycles seen so far              */
FILE    *Objfil = 0;              /* object file's file descriptor        */
char    *Obj_name = 0;
char    *Obj_short = 0;
/*
*      as ---  cross assembler main program
*/
int main(int argc, char *argv[])
{
	char    **np;

	if (argc < 2){
		printf("Usage: %s [files]\n", *argv);
		return(1);
	}
	Gargv = argv;    /* make names globally accessible */
	N_files = argc - 1;
	initialize();
	fprintf(Objfil, "S0030000FC\n"); /* optional S0 record */
	Cfn = 0;
	np = argv;
	while (++Cfn <= N_files)
		if ((fopen_s(&Fd, *++np, "r")) != 0)
			printf("as: can't open %s\n", *np);
		else{
			Line_num = 0; /* reset line number */
			make_pass();
			fclose(Fd);
		}
		if (Err_count == 0){
			Pass++;
			re_init();
			Cfn = 0;
			np = argv;
			while (++Cfn <= N_files)
				if ((fopen_s(&Fd, *++np, "r")) == 0){
					Line_num = 0;
					make_pass();
					fclose(Fd);
				}
			fprintf(Objfil, "S9030000FC\n"); /* at least give a decent ending */
		}
		printf("Errors: %d\n", Err_count);/* necessary for brain-damaged system */
		if (Obj_name != NULL)
			free(Obj_name);
		if (Obj_short != NULL)
			free(Obj_short);
		return(Err_count);
}

void initialize()
{
#ifdef DEBUG
	printf("Initializing\n");
#endif
	Err_count = 0;
	Pc = 0;
	Pass = 1;
	Lflag = 1;
	Cflag = 0;
	Line[MAXBUF - 1] = NEWLINE;       /* guard against garbage input */
	Obj_name = alloc(MAXBUF);
	Obj_short = alloc(MAXBUF);
	sprintf_s(Obj_short, MAXBUF, "%s", *++Gargv);
	strip_ext(Obj_short);
	sprintf_s(Obj_name, MAXBUF, "%s.s19\0", Obj_short);
	if ((fopen_s(&Objfil, Obj_name, "w")) != 0)
		fatal("Can't create object file");
	fwdinit();      /* forward ref init */
	localinit();    /* target machine specific init. */
}

void re_init()
{
#ifdef DEBUG
	printf("Reinitializing\n");
#endif
	Pc = 0;
	E_total = 0;
	P_total = 0;
	Lflag = 1;
	Cflag = 0;
	Ctotal = 0;
	fwdreinit();
}

void make_pass()
{
#ifdef DEBUG
	printf("Pass %d\n", Pass);
#endif
	while (getaline()){
		P_force = 0;    /* No force unless bytes emitted */
		if (parse_line())
			process();
		if (Pass == 2 && Lflag)
			print_line();
		P_total = 0;    /* reset byte count */
		Cycles = 0;     /* and per instruction cycle count */
	}
	f_record();
}

/*
*      getaline --- collect (possibly continued) an input line
*/
int getaline()
{
	register char *p = Line;
	int remaining = MAXBUF - 2;       /* space left in Line */
	int len;                        /* line length */

	while (fgets(p, remaining, Fd) != (char *)NULL){
		Line_num++;
		if ((len = strlen(p) - 2) <= 0)
			return(1);      /* just an empty line */
		p += len;
		if (*p != '\\')
			return(1);      /* not a continuation */
		remaining -= len + 2;
		if (remaining<3)
			warn("Continuation too long");
	}
	return(0);
}

/*
*      parse_line --- split input line into label, op and operand
*/
int parse_line()
{
	register char *ptrfrm = Line;
	register char *ptrto = Label;

	if (*ptrfrm == '*' || *ptrfrm == '\n' || *ptrfrm == ';')
		return(0);      /* a comment line */

	while (delim(*ptrfrm) == NO)
		*ptrto++ = *ptrfrm++;
	if (*--ptrto != ':')ptrto++;     /* allow trailing : */
	*ptrto = EOS;

	ptrfrm = skip_white(ptrfrm);

	ptrto = Op;
	while (delim(*ptrfrm) == NO)
		*ptrto++ = mapdn(*ptrfrm++);
	*ptrto = EOS;

	ptrfrm = skip_white(ptrfrm);

	ptrto = Operand;
	while (*ptrfrm != NEWLINE)
		*ptrto++ = *ptrfrm++;
	*ptrto = EOS;

	// handle comments preceeded by whitespace
	if (*Op == '*' || *Op == ';')
		return(0);

#ifdef DEBUG
	printf("Label-%s-\n", Label);
	printf("Op----%s-\n", Op);
	printf("Operand-%s-\n", Operand);
#endif
	return(1);
}

/*
* process --- determine mnemonic class and act on it
*/
void process()
{
	register struct oper *i;

	Old_pc = Pc;            /* setup `old' program counter */
	Optr = Operand;         /* point to beginning of operand field */

	if (*Op == EOS){           /* no mnemonic */
		if (*Label != EOS)
			install(Label, Pc);
	}
	else if ((i = mne_look(Op)) == NULL)
		error("Unrecognized Mnemonic");
	else if (i->class == PSEUDO)
		do_pseudo(i->opcode);
	else{
		if (*Label)install(Label, Pc);
		if (Cflag)Cycles = i->cycles;
		do_op(i->opcode, i->class);
		if (Cflag)Ctotal += Cycles;
	}
}

void strip_ext(char *fname)
{
	char *end = fname + strlen(fname);

	while (end > fname && *end != '.' && *end != '\\' && *end != '/')
		--end;
	if ((end > fname && *end == '.') && (*(end - 1) != '\\' && *(end - 1) != '/'))
		*end = '\0';
}

