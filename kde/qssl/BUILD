(

  export  QTDIR=${INSTALL_ROOT}/usr                                   &&
  qmake   qssl.pro                                                    &&
  make                                                                &&
  prepare_install                                                     &&
  cp  libqssl.so  /usr/lib

) > $C_FIFO 2>&1
