#include "func.h"
#include "AS.H"
/*
 *      in memory version of forward ref handler
 */
 
#define MAXFWD  500
 
struct fref{
 int     f_fno;  /* file number */
 int     f_line; /* line number */
 };
 
struct fref *Fbase = NULL;
struct fref *Fnext = NULL;
int Fleft = 0;
 
/*
 *      fwdinit --- initialize forward ref array
 */
void fwdinit()
{
 
 Fbase = (struct fref *)malloc( sizeof(struct fref) * MAXFWD );
 if( Fbase == (struct fref *)NULL )
  fatal("No mem for fwd refs");
 Fnext = Fbase;
 Fleft = MAXFWD-1;
}
 
/*
 *      fwdreinit --- reinitialize forward ref file
 */
void fwdreinit()
{
 Fnext->f_fno = Fnext->f_line = 0;
 Fnext = Fbase;
 Ffn = Fnext->f_fno;
 F_ref = Fnext->f_line;
 Fnext++;
}
 
/*
 *      fwdmark --- mark current file/line as containing a forward ref
 */
void fwdmark()
{
 if( Fleft != 0 ){
  Fnext->f_fno = Cfn;
  Fnext->f_line = Line_num;
  Fnext++;
  Fleft--;
  }
 else
  error("No space for fwd refs");
}
 
/*
 *      fwdnext --- get next forward ref
 */
void fwdnext()
{
 Ffn = Fnext->f_fno;
 F_ref = Fnext->f_line;
 Fnext++;
#ifdef DEBUG
 printf("Next Fwd ref: %d,%d\n",Ffn,F_ref);
#endif
}

