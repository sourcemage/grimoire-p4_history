sedit  's:man_prefix=.*:man_prefix=$(prefix)/share:'  Make.Rules  &&
# note that, yes indeed, they typo'd the extra S
sedit  "s:^COPTFLAGS=.*:COPTFLAG=${CFLAGS}:"  Make.Rules  &&
sedit  "s:^LDFLAGS=.*:LDFLAGS=${LDFLAGS}:"  Make.Rules  &&
make
