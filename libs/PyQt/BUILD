(

  /bin/echo  "yes"  |  QMAKESPEC=/usr/share/qt/mkspecs/default               \
  python ./build.py -b /usr/bin -v /usr/share/sip			&&
  prepare_install                                                       &&
# do it here because the make changes python site packages
  make                                                                  &&
  make install

) > $C_FIFO 2>&1
