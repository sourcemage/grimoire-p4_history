(

  # set up the path to mozilla-config script
  export PATH=$PATH:/usr/lib/mozilla                   &&
  ./configure                                          \
    --host=$HOST                                       \
    --build=$BUILD                                     \
    --prefix=$INSTALL_ROOT/usr                         \
    --sysconfdir=$INSTALL_ROOT/etc                     \
    --localstatedir=$INSTALL_ROOT/var                  \
    --with-plugin-install-dir=/usr/lib/mozilla/plugins \
    $OPTS                                              &&

  make            &&
  prepare_install &&
  make    install

) >$C_FIFO 2>&1
