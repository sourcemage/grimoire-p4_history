(

  sedit '/^INCLUDEPATH/ s/= \./= @BL_INCLUDEPATH@/' $SOURCE_DIRECTORY/pyuic3/pyuic.pro                         &&
  QMAKESPEC=/usr/share/qt/mkspecs/default \
  python ./build.py -c -i /usr/include/qt -b /usr/bin -q /usr  &&
  make                                                         &&
  prepare_install                                              &&
  make install

) > $C_FIFO 2>&1
