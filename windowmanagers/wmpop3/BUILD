(

  cp $SCRIPT_DIRECTORY/Makefile /usr/src/wmpop3-${VERSION}/wmpop3/  &&
  cd /usr/src/wmpop3-${VERSION}/wmpop3                              &&
  make                                                              &&
  prepare_install                                                   &&
  make install1

) > $C_FIFO 2>&1
