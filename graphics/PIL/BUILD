(

  cd libImaging               &&
  ./configure                 &&
  make                        &&
  cd ..                       &&
  python setup.py build       &&
  prepare_install             &&
  cd libImaging               &&
  cp ImConfig.h ImPlatform.h Imaging.h /usr/include/python2.2 &&
  cd ..                       && 
  python setup.py install

) > $C_FIFO 2>&1
