(

  ./config_unix.py             &&
  ./setup.py build             &&
  ./setup.py install           &&
  mkdir -p /usr/doc/pyvorbis   &&
  cp -r test /usr/doc/pyvorbis

) > $C_FIFO 2>&1
