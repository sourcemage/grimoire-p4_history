(

  sedit  "s/CFLAGS   = -Wall/CFLAGS   = $CFLAGS/"  Makefile  &&

  make                        &&
  prepare_install             &&

  cp disktype /usr/bin/disktype

) > $C_FIFO 2>&1
