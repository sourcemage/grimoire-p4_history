## conditionally run `make' if SWIG dependency is on
## @usage <1:make target>
function make_if_swig() {
  if echo "$OPTS" | grep -q 'with-swig'; then
    make $1
  fi
}

(

  if echo $OPTS | grep -q 'without-berkeley-db'; then
    patch -p1 < $SCRIPT_DIRECTORY/swigpyext.patch
  fi &&

  ./configure \
    --build=$BUILD \
    --prefix=$INSTALL_ROOT/usr \
    --sysconfdir=$INSTALL_ROOT/etc \
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
  make_if_swig swig-py &&

  if spell_installed Python; then
    make check
  fi &&

  prepare_install &&
  make install &&
  make_if_swig install-swig-py

) >$C_FIFO 2>&1
