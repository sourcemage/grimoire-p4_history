(

  patch -p0  <  $SCRIPT_DIRECTORY/zw-fix  &&

  ./configure  --prefix=/usr              &&
  make                                    &&
  prepare_install                         &&
  make    install                         &&

  # temporary hack to fix problems with configure scripts
  ln  -sf  /usr/lib/python2.2/config/libpython2.2.a  /usr/lib/python2.2/config/libpython2.2.1.a

) > $C_FIFO 2>&1

