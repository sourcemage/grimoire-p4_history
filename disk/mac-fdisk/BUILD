(

  patch -p1 < $SPELL_DIRECTORY/patch.diff &&

  make                               &&
  prepare_install                    &&
  make install

) > $C_FIFO 2>&1
