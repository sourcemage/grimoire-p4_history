(

  patch  -p1  <  $SCRIPT_DIRECTORY/gcc-3.4.patch  &&
  touch  doc/rxvt.tbl                             &&
  OPTS="$OPTS --enable-everything"                &&
  default_build
) > $C_FIFO 2>&1
