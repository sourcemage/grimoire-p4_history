(

  sedit "s:/local::" Makefile            &&
  sedit "s:PREFIX=/usr:PREFIX=${INSTALL_ROOT}/usr:" Makefile &&

  cd  lib                                &&
  ./configure $INSTALL_ROOT/usr/share                 &&
  cd  ..                                 &&
  make                                   &&
  prepare_install                        &&

  make  install                          &&

  cd  lib                                &&
  make                                   &&

  mkdir  -p        $INSTALL_ROOT/usr/include/pci      &&
  cp     *.h       $INSTALL_ROOT/usr/include/pci      &&
  cp     libpci.a  $INSTALL_ROOT/usr/lib

) > $C_FIFO 2>&1
