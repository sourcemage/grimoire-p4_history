(

  patch  configure  $SCRIPT_DIRECTORY/configure.patch  &&

  ./configure \
    --build=$BUILD \
    --prefix=$INSTALL_ROOT/usr \
    --sysconfdir=$INSTALL_ROOT/etc \
    --localstatedir=$INSTALL_ROOT/var \
    $OPTS &&
  make &&
  make runtime &&
  prepare_install &&
  make install &&
  make install-runtime

) >$C_FIFO 2>&1
