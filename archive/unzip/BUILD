(

  sedit  "s/-O /$CFLAGS /;s|)/man|)/share/man|"  unix/Makefile
  make  -f unix/Makefile generic  &&
  prepare_install                 &&
  make  prefix=${INSTALL_ROOT}/usr -f unix/Makefile install

) > $C_FIFO 2>&1
