(

  gzip   -dc  <  $SOURCE_CACHE/$SOURCE2  |
  patch  -p1                             &&
  make   -f  Makefile.std                \
         CCOPTS="$CFLAGS"                &&
  prepare_install                        &&
  mkdir  -p  /usr/doc/xv                 &&
  make   -f  Makefile.std                \
         BINDIR=/usr/X11R6/bin           \
         MANDIR=/usr/X11R6/man           \
         LIBDIR=/usr/doc/xv              \
         install

) > $C_FIFO 2>&1
