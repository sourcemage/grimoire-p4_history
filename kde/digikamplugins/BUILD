(
  patch -p0 < $SPELL_DIRECTORY/sh.diff admin/cvs.sh	&&
  make -f Makefile.cvs 	&&
  default_build

) > $C_FIFO 2>&1
