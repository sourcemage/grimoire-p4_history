rm Makefile &&
echo  "CFLAGS = $CFLAGS -DNDEBUG"  >  Makefile &&
grep  -v  "^CFLAGS"  Makefile.Linux  >>  Makefile &&
sedit  "s!/local!${INSTALL_ROOT}!"  Makefile &&

make
