(
  cd $SOURCE_DIRECTORY                             &&
  cp -dPR lib/* $INSTALL_ROOT/lib                  &&
  cd $INSTALL_ROOT/lib/modules/fglrx/build_mod     &&
  ./make.sh                                        &&
  cd $INSTALL_ROOT/lib/modules/fglrx/              &&
  ./make_install.sh                                &&
  cd $SOURCE_DIRECTORY                             &&
  cp -dPR usr/include/GL/glxATI.h \
    $INSTALL_ROOT/usr/include/GL                   &&
  cp -dPR usr/X11R6/include/* \
    $INSTALL_ROOT/usr/X11R6/include/               &&
  cp -dPR usr/X11R6/lib/* \
    $INSTALL_ROOT/usr/X11R6/lib/                   &&
  rm -f usr/X11R6/bin/LICENSE*                     &&
  bunzip2 -c usr/X11R6/bin/fireglcontrol.qt3*bz2 > usr/X11R6/bin/fireglcontrol &&
  chmod +x usr/X11R6/bin/fireglcontrol             &&
  rm -f usr/X11R6/bin/fireglcontrol.qt*            &&
  cp -dPR usr/X11R6/bin/* \
    $INSTALL_ROOT/usr/X11R6/bin/                   &&
  cp -dPR usr/share/applnk/* \
    $INSTALL_ROOT/usr/share/applnk/                &&
  cp -dPR usr/share/pixmaps/* \
    $INSTALL_ROOT/usr/share/pixmaps/
) > $C_FIFO 2>&1
