(

  cd Xft1    &&
  xmkmf  -a                          &&
  sedit  's:^FREETYPE2INCLUDES=$(TOP_X_INCLUDES)/freetype2:FREETYPE2INCLUDES=-I/usr/include/freetype2:' Makefile      &&
  make                               &&
  prepare_install &&
  make  install

) > $C_FIFO 2>&1
