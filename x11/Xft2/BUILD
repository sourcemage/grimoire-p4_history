(

  cd Xft     &&
  xmkmf  -a  &&
  
  sedit  's:^FREETYPE2INCLUDES=$(TOP_X_INCLUDES)/freetype2:FREETYPE2INCLUDES=-I/usr/include/freetype2:'  Makefile  &&
  sedit  's:$(DESTDIR)$(USRLIBDIR)/pkgconfig:/usr/lib/pkgconfig:'  Makefile  &&
  
  make            &&
  prepare_install &&
  make install
  
) > $C_FIFO 2>&1
