#include "func.h"
#define HASHSIZE 100                            /* width of hash table */
static struct nlist *hashtab[HASHSIZE] = {0};   /* symbol table */
 
/*
 *      hash --- form hash value for string s
 */
hash(s)
char *s;
{
 int     hashval;
 
 for( hashval = 0; *s != EOS ; )
  hashval += *s++;
 return(hashval % HASHSIZE );
}
 
/*
 *      install --- add a symbol to the table
 */
install(str,val)
char    *str;
int     val;
{
 register struct nlist *np;
 int     i;
 
 if( !alpha(*str) ){
  error("Illegal Symbol Name");
  return(NO);
  }
 if( (np = lookup(str)) != NULL ){
  if( Pass==2 ){
   if( np->def == val )
    return(YES);
   else{
    error("Phasing Error");
    return(NO);
    }
   }
  error("Symbol Redefined");
  return(NO);
  }
 /* enter new symbol */
#ifdef DEBUG
 printf("Installing %s as %d\n",str,val);
#endif
 np = (struct nlist *) malloc(sizeof(struct nlist));
 if( np == (struct nlist *)NULL ){
  error("Symbol table full");
  return(NO);
  }
 np->name = malloc(strlen(str)+1);
 if( np->name == (char *)NULL ){
  error("Symbol table full");
  return(NO);
  }
 strcpy(np->name,str);
 np->def = val;
 i = hash(np->name);
 np->next = hashtab[i];
 hashtab[i] = np;
 return(YES);
}
 
/*
 *      lookup --- find string in symbol table
 */
struct nlist *
lookup(name)
char    *name;
{
 struct nlist *np;
// int     i;
 
 for( np = hashtab[hash(name)] ; np != NULL ; np = np->next)
  if( strcmp(name,np->name)==0 ){
   Last_sym = np->def;
   return(np);
   }
 Last_sym = 0;
 if(Pass==2)
  error("Symbol Undefined on Pass 2");
 return(NULL);
}
 
 
#define NMNE (sizeof(table)/ sizeof(struct oper))
#define NPSE (sizeof(pseudo)/ sizeof(struct oper))
/*
 *      mne_look --- mnemonic lookup
 *
 *      Return pointer to an oper structure if found.
 *      Searches both the machine mnemonic table and the pseudo table.
 */
struct oper *
mne_look(str)
char    *str;
{
 struct oper *low,*high,*mid;
 int     cond;
 
 /* Search machine mnemonics first */
 low =  &table[0];
 high = &table[ NMNE-1 ];
 while (low <= high){
  mid = low + (high-low)/2;
  if( ( cond = strcmp(str,mid->mnemonic)) < 0)
   high = mid - 1;
  else if (cond > 0)
   low = mid + 1;
  else
   return(mid);
 }
 
 /* Check for pseudo ops */
 low =  &pseudo[0];
 high = &pseudo[ NPSE-1 ];
 while (low <= high){
  mid = low + (high-low)/2;
  if( ( cond = strcmp(str,mid->mnemonic)) < 0)
   high = mid - 1;
  else if (cond > 0)
   low = mid + 1;
  else
   return(mid);
 }
 
 return(NULL);
}
