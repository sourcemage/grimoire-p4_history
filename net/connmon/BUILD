(

  patch  -p1  <  $SCRIPT_DIRECTORY/connmon.patch
  make                                            &&
  prepare_install                                 &&
  cp  src/connmon/connmon  /usr/bin

) > $C_FIFO 2>&1
