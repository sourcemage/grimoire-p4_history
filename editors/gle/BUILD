(
 
  sedit "s/-O2/$CFLAGS/" config.gcc
  sedit "s/\/usr/${INSTALL_ROOT}\/usr/" config.gcc
  make  -f Makefile.gcc                        &&
  prepare_install                              &&
  make -f Makefile.gcc install                 &&
  cp  $SOURCE_CACHE/$SOURCE2  /usr/doc    

) > $C_FIFO 2>&1
