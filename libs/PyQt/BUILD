(

  echo  "yes"  |  QMAKESPEC=/usr/share/qt/mkspecs/default               \
  python ./build.py -c -i /usr/include/qt -b /usr/bin -q /usr -l qt-mt  &&
  make                                                                  &&
  prepare_install                                                       &&
  make install

) > $C_FIFO 2>&1
