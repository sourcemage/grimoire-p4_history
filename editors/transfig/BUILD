(

  patch -p0 < $SCRIPT_DIRECTORY/${SPELL}.${VERSION}.fig2dev.Imakefile.patch &&
  xmkmf                                         &&
  make Makefiles                                &&
  patch -p0 < $SCRIPT_DIRECTORY/transfig.patch  &&
  make                                          &&
  prepare_install                               &&
  make install                                  &&
  make install.man

) > $C_FIFO 2>&1
