(

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    $OPTS &&
  make &&
  python setup.py build &&
  prepare_install &&
  python setup.py install --prefix=/usr

) >$C_FIFO 2>&1
