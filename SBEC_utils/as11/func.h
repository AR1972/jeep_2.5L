void exit(int status);
void free(void *ptr);
re_init();
char mapdn(char c);
char *alloc();
make_pass();
getaline();
parse_line();
initialize();
process();
struct oper *mne_look();
strip_ext(char *fname);
localinit();
bitop(int op,int mode,int class);
do_gen(int op,int mode,int pnorm,int px,int py);
do_indexed(int op);
epage(int p);
char *skip_white(char* ptr);
fatal(char* str);
error(char* str);
warn(char* str);
delim(char c);
eword(int wd);
emit(int byte);
void f_record();
print_line();
any(char c,char* str);
hibyte(int i);
head(char* str1,char* str2);
alpha(char c);
alphan(char c);
white(char c);
char *alloc(int nbytes);
eval();
is_op(char c);
get_term();
fwdinit();
fwdreinit();
fwdmark();
fwdnext();
do_pseudo(int op);
hash(char* s);
install(char* str,int val);
struct nlist* lookup(char* name);
struct oper* mne_look(char* str);
hexout(int byte);
void* malloc(int n);
lobyte(int i);
void do_op(int opcode,int class);
