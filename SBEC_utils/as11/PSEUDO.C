#include "func.h"
#include "AS.H"
/*
 * pseudo --- pseudo op processing
 */
/*
 * do_pseudo --- do pseudo op processing
 */
void do_pseudo(int op)
{
 char fccdelim;
// int     j;
 int     fill;
 //char* skip_white();
 
 if( op != EQU && *Label )
  install(Label,Pc);
 
 P_force++;
 switch(op){
  case RMB:                       /* reserve memory bytes */
   if( eval() ){
    Pc +=  Result;
    f_record();     /* flush out bytes */
    }
   else
    error("Undefined Operand during Pass One");
   break;
  case ZMB:                       /* zero memory bytes */
   if( eval() )
    while( Result-- )
     emit(0);
   else
    error("Undefined Operand during Pass One");
   break;
  case FILL:                      /* fill memory with constant */
   eval();
   fill = Result;
   if( *Optr++ != ',' )
    error("Bad fill");
   else{
    Optr = skip_white(Optr);
    eval();
    while( Result-- )
     emit(fill);
    }
   break;
  case FCB:                       /* form constant byte(s) */
   do{
    Optr = skip_white(Optr);
    eval();
    if( Result > 0xFF ){
     if(!Force_byte)
      warn("Value truncated");
     Result = lobyte(Result);
     }
    emit(Result);
   }while( *Optr++ == ',' );
   break;
  case FDB:                       /* form double byte(s) */
   do{
    Optr = skip_white(Optr);
    eval();
    eword(Result);
   }while( *Optr++ == ',' );
   break;
  case FCC:                       /* form constant characters */
   if(*Operand==EOS)
    break;
   fccdelim = *Optr++;
   while( *Optr != EOS && *Optr != fccdelim)
    emit(*Optr++);
   if(*Optr == fccdelim)
    Optr++;
   else
    error("Missing Delimiter");
   break;
  case ORG:                       /* origin */
   if( eval() ){
    Old_pc = Pc = Result;
    f_record();     /* flush out any bytes */
    }
   else
    error("Undefined Operand during Pass One");
   break;
  case EQU:                       /* equate */
   if(*Label==EOS){
    error("EQU requires label");
    break;
    }
   if( eval() ){
    install(Label,Result);
    Old_pc = Result;        /* override normal */
    }
   else
    error("Undefined Operand during Pass One");
   break;
  case OPT:                       /* assembler option */
   P_force=0;
   if( head(Operand,"l") )
    Lflag=1;
   else if( head(Operand,"nol"))
    Lflag=0;
   else if( head(Operand,"c")){
    Cflag=1;
    Ctotal=0;
    }
   else if( head(Operand,"noc"))
    Cflag=0;
   else if( head(Operand,"contc")){
    Cflag=1;
    }
   else
    error("Unrecognized OPT");
   break;
  case NULL_OP:                   /* ignored psuedo ops */
   P_force=0;
   break;
  default:
   fatal("Pseudo error");
  }
}
