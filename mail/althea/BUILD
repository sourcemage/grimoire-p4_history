(

  MAKE_OPTS="DESTDIR=/usr/bin  PIXDIR=/usr/share/althea  DOCDIR=/usr/doc/althea"

  sedit  "s:CFLAGS = :CFLAGS = $CFLAGS :"  Makefile
  make  $MAKE_OPTS  &&
  prepare_install   &&
  make    install  $MAKE_OPTS

) > $C_FIFO 2>&1
