(

  export  QTDIR=${INSTALL_ROOT}/usr                                   &&
  qmake   qssl.pro                                                    &&
  sedit   "s:-I\$(QTDIR)/include:-I\$(QTDIR)/include/qt:g"  Makefile  &&
  make                                                                &&
  prepare_install                                                     &&
  cp  libqssl.so  /usr/lib

) > $C_FIFO 2>&1
