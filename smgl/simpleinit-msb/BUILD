(

  ./configure                     &&
  make  OPT="$CFLAGS"             &&

  prepare_install                 &&

  make  install                   &&
  install  -m 644  $SCRIPT_DIRECTORY/inittab /etc/

) > $C_FIFO 2>&1
