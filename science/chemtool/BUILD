(

  bzcat  $SCRIPT_DIRECTORY/Makefile.diff.bz2  |  patch -p0  &&
  make             &&
  prepare_install  &&
  make  install

) > $C_FIFO 2>&1
