(
  sedit "s/-O2/$CFLAGS/" makefile.gcc &&
  make -f makefile.gcc  &&
  prepare_install       &&
  cp unrar /usr/bin

) >$C_FIFO 2>&1
