(

  TEXMF=$( kpsetool -v '$TEXMFLOCAL' )  &&
  rm  *.o  &&
  make  CFLAGS="$CFLAGS"  &&
  prepare_install  &&
  make  BINDIR=/usr/bin  install  &&
  install  -D  -m 644  pmx.tex  $TEXMF/tex/pmx/pmx.tex

) > $C_FIFO 2>&1
