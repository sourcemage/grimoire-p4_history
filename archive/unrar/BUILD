(
  sedit "s/-O2/$CFLAGS/" makefile.unix &&
  make -f makefile.unix  &&
  prepare_install       &&
  cp unrar ${INSTALL_ROOT}/usr/bin

) >$C_FIFO 2>&1
