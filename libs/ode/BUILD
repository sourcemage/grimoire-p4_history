(

  sedit  '/C_FLAGS+/d'  config/makefile.unix-gcc  &&
  sedit  's/)1/)/'  Makefile                      &&

  make  PLATFORM=unix-gcc  OPT=""  C_OPT="$CFLAGS"  configure  ode-lib  &&
  prepare_install                       &&
  cp  -avr  include/ode/  /usr/include  &&
  cp  -avr  lib/* /usr/lib

) > $C_FIFO 2>&1
