(

  sedit '139,162s/$/\\n\\/' amap.c    &&
  sedit '53,73s/$/\\n\\/' amapcrap.c  &&

  make all                            &&

  prepare_install                     &&

  cp amap amapcrap /usr/bin           &&
  cp appdefs.trig appdefs.resp /etc   &&
  cp amap.1 /usr/man/man1

) > $C_FIFO 2>&1
