(
  sed -i "s|man/man|share/man/man|"  setup.py  &&
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    $OPTS                                       &&
  make                                          &&
  python setup.py build                         &&
  prepare_install                               &&
  python setup.py install --prefix=/usr         &&
  mkdir -p /etc/webcleaner                      &&
  webcleaner-certificates install
) >$C_FIFO 2>&1
