(

  patch -p1 < $SCRIPT_DIRECTORY/transfig.3.2.3d.fig2dev.Imakefile.patch &&
  xmkmf                            &&
  make Makefiles                   &&
  make                             &&
  prepare_install                  &&
  make install                     &&
  make install.man

) > $C_FIFO 2>&1
