(

  QMAKESPEC=/usr/share/qt/mkspecs/default \
  python ./build.py -i /usr/include/qt -q /usr  &&
  make                                          &&
  prepare_install                               &&
  make install

) > $C_FIFO 2>&1
