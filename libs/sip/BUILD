(
  prepare_install                                          &&

  echo  "yes"  |  QMAKESPEC=/usr/share/qt/mkspecs/default  \
  python ./build.py -b /usr/bin -i /usr/include/qt -q /usr -l qt-mt    &&
  make                                                     &&
  make install						   &&
  mkdir -p /usr/share/sip

) > $C_FIFO 2>&1
