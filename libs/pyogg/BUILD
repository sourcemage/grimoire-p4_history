(

  ./config_unix.py          &&
  ./setup.py build          &&
  ./setup.py install        &&
  mkdir -p /usr/doc/pyogg   &&
  cp -r test /usr/doc/pyogg

) > $C_FIFO 2>&1
