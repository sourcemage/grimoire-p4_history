(

  patch < $SCRIPT_DIRECTORY/Makefile.diff  &&
  make  ROOT=                              &&
  prepare_install                          &&
  make  ROOT= install

) > $C_FIFO 2>&1
