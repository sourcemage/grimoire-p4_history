(

#  sedit  "s/^UISTYLE=text/UISTYLE=$UI/"  Makefile  &&

  make  CFLAGS=""  UISTYLE="$UI"  &&
  prepare_install  &&
  make  CFLAGS=""  UISTYLE="$UI"  INSTALLDIR=$INSTALL_ROOT/usr/bin  install

) > $C_FIFO 2>&1
