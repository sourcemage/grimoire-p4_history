(

  cd  lib                                &&
  ./configure /usr/share                 &&
  cd  ..                                 &&
  make                                   &&
  prepare_install                        &&

  make  PREFIX=/usr  ROOT=/usr  install  &&

  cd  lib                                &&
  make                                   &&

  mkdir  -p        /usr/include/pci      &&
  cp     *.h       /usr/include/pci      &&
  cp     libpci.a  /usr/lib

) > $C_FIFO 2>&1
