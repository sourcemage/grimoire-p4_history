(

  if echo $OPTS | grep -q 'without-berkeley-db'; then
    patch -p1 < $SCRIPT_DIRECTORY/swigpyext.patch
  fi &&

  ./configure \
    --build=$BUILD \
    --prefix=$INSTALL_ROOT/usr \
    --sysconfdir=/etc \
    --localstatedir=$INSTALL_ROOT/var \
    --disable-debug \
    --disable-mod-activation \
    --disable-static \
    --enable-dso \
    --enable-shared \
    --without-apxs \
    --without-berkeley-db \
    $OPTS &&
  make &&

  INSTALL_SWIG_PYTHON=n &&
  if echo "$OPTS" | grep -q 'with-swig'; then
    make swig-py-ext &&
    INSTALL_SWIG_PYTHON=y
  fi &&

  if spell_installed Python; then
    make check
  fi &&

  prepare_install &&
  make    install &&

  if [ "$INSTALL_SWIG_PYTHON" == "y" ]; then
    make install-swig-py-ext
  fi

) >$C_FIFO 2>&1
