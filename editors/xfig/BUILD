(

  patch  -p1  <  $SCRIPT_DIRECTORY/xfig.3.2.3d.Imakefile.patch  &&
  xmkmf                            &&
  make                             &&
  prepare_install                  &&
  make install                     &&
  make install.doc                 &&
  make install.man                 &&
  cd  /etc/X11/app-defaults        &&
  # Changes netscape to mozilla and acroread to xpdf as defaults
  bzcat  $SCRIPT_DIRECTORY/Fig.diff.bz2  |  patch  -p0

) > $C_FIFO 2>&1
