(
  OPTS="$OPTS --enable-everything"
  sedit  's/^subdirs = src doc/subdirs = src /'  Makefile.in
  default_build  &&
  mkdir  -p  /usr/share/man/man1  &&
  cp  doc/rxvt.1  /usr/share/man/man1
) > $C_FIFO 2>&1
