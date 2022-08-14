char mapdn();
char *alloc();
/*
 *      as ---  cross assembler main program
 */
main(argc,argv)
int     argc;
char    **argv;
{
 char    **np;
 FILE    *fopen();
 
 if(argc < 2){
  printf("Usage: %s [files]\n",*argv);
  exit(1);
  }
 Gargv = argv;    /* make names globally accessible */
 N_files = argc-1;
 initialize();
 fprintf(Objfil,"S0030000FC\n"); /* optional S0 record */
 Cfn = 0;
 np = argv;
 while( ++Cfn <= N_files )
  if((Fd = fopen(*++np,"r")) == NULL)
   printf("as: can't open %s\n",*np);
  else{
   Line_num = 0; /* reset line number */
   make_pass();
   fclose(Fd);
  }
 if( Err_count == 0 ){
  Pass++;
  re_init();
  Cfn = 0;
  np = argv;
  while( ++Cfn <= N_files)
   if((Fd = fopen(*++np,"r")) != NULL){
    Line_num = 0;
    make_pass();
    fclose(Fd);
    }
  fprintf(Objfil,"S9030000FC\n"); /* at least give a decent ending */
  }
 printf("Errors: %d\n",Err_count);/* necessary for brain-damaged system */
 if (Obj_name != NULL)
  free(Obj_name);
 if (Obj_short != NULL)
  free(Obj_short);
 exit(Err_count);
}
 
initialize()
{
 FILE    *fopen();
 
#ifdef DEBUG
 printf("Initializing\n");
#endif
 Err_count = 0;
 Pc        = 0;
 Pass      = 1;
 Lflag     = 1;
 Cflag     = 0;
 Line[MAXBUF-1] = NEWLINE;       /* guard against garbage input */
 Obj_name = alloc(256);
 Obj_short = alloc(256);
 sprintf(Obj_short, "%s", *++Gargv);
 strip_ext(Obj_short);
 sprintf(Obj_name, "%s.s19\0", Obj_short);
 if( (Objfil = fopen(Obj_name,"w")) == NULL)
  fatal("Can't create object file");
 fwdinit();      /* forward ref init */
 localinit();    /* target machine specific init. */
}
 
re_init()
{
#ifdef DEBUG
 printf("Reinitializing\n");
#endif
 Pc      = 0;
 E_total = 0;
 P_total = 0;
 Lflag   = 1;
 Cflag   = 0;
 Ctotal  = 0;
 fwdreinit();
}
 
make_pass()
{
#ifdef DEBUG
 printf("Pass %d\n",Pass);
#endif
 while( getaline() ){
  P_force = 0;    /* No force unless bytes emitted */
  if(parse_line())
   process();
  if(Pass == 2 && Lflag)
   print_line();
  P_total = 0;    /* reset byte count */
  Cycles = 0;     /* and per instruction cycle count */
  }
 f_record();
}
 
/*
 *      getaline --- collect (possibly continued) an input line
 */
getaline()
{
 char *fgets();
 register char *p = Line;
 int remaining = MAXBUF-2;       /* space left in Line */
 int len;                        /* line length */
 
 while( fgets(p,remaining,Fd) != (char *)NULL ){
  Line_num++;
  if((len = strlen(p)-2)<=0)
   return(1);      /* just an empty line */
  p += len;
  if( *p != '\\' )
   return(1);      /* not a continuation */
  remaining -= len+2;
  if(remaining<3)
   warn("Continuation too long");
  }
 return(0);
}
 
/*
 *      parse_line --- split input line into label, op and operand
 */
parse_line()
{
 register char *ptrfrm = Line;
 register char *ptrto = Label;
 char *skip_white();
 
 if( *ptrfrm == '*' || *ptrfrm == '\n' || *ptrfrm == ';')
  return(0);      /* a comment line */
 
 while( delim(*ptrfrm)== NO )
  *ptrto++ = *ptrfrm++;
 if(*--ptrto != ':')ptrto++;     /* allow trailing : */
 *ptrto = EOS;
 
 ptrfrm = skip_white(ptrfrm);
 
 ptrto = Op;
 while( delim(*ptrfrm) == NO)
  *ptrto++ = mapdn(*ptrfrm++);
 *ptrto = EOS;
 
 ptrfrm = skip_white(ptrfrm);
 
 ptrto = Operand;
 while( *ptrfrm != NEWLINE )
  *ptrto++ = *ptrfrm++;
 *ptrto = EOS;
 
// handle comments preceeded by whitespace
 if( *Op == '*' || *Op == ';')
    return(0);

#ifdef DEBUG
 printf("Label-%s-\n",Label);
 printf("Op----%s-\n",Op);
 printf("Operand-%s-\n",Operand);
#endif
 return(1);
}
 
/*
 * process --- determine mnemonic class and act on it
 */
process()
{
 register struct oper *i;
 struct oper *mne_look();
 
 Old_pc = Pc;            /* setup `old' program counter */
 Optr = Operand;         /* point to beginning of operand field */
 
 if(*Op==EOS){           /* no mnemonic */
  if(*Label != EOS)
   install(Label,Pc);
  }
 else if( (i = mne_look(Op))== NULL)
  error("Unrecognized Mnemonic");
 else if( i->class == PSEUDO )
  do_pseudo(i->opcode);
 else{
  if( *Label )install(Label,Pc);
  if(Cflag)Cycles = i->cycles;
  do_op(i->opcode,i->class);
  if(Cflag)Ctotal += Cycles;
  }
}

strip_ext(char *fname)
{
    char *end = fname + strlen(fname);

    while (end > fname && *end != '.' && *end != '\\' && *end != '/') {
        --end;
    }
    if ((end > fname && *end == '.') &&
        (*(end - 1) != '\\' && *(end - 1) != '/')) {
        *end = '\0';
    }
}
