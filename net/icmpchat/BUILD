(

  sedit  "s/FLAGS = -O2/FLAGS = $CFLAGS/"    Makefile
  make icmpchat       &&
  prepare_install     &&
  cp icmpchat /usr/bin/icmpchat
  cp man/icmpchat.8.gz /usr/man/man8/icmpchat.8.gz

) > $C_FIFO 2>&1
