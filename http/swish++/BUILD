(

  patch -p1 < $SCRIPT_DIRECTORY/$SPELL.diff &&
  make &&
  prepare_install &&
  make install

) >$C_FIFO 2>&1
