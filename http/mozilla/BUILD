## @usage: make_crypto <1:target>
function make_crypto() {
  if echo "$OPTS" | grep -q 'enable-crypto'; then
    message "Building crypto support, target: ${1:-default}..." &&
    pushd security/manager && make $1 && popd
  fi
}

(

  MOZILLA_HOME=$INSTALL_ROOT/usr/lib/mozilla &&

  # No fast optimization for Mozilla, bit us so many times...
  CFLAGS="${CFLAGS//-O3/-O2}" &&
  CXXFLAGS="${CXXFLAGS//-O3/-O2}" &&

  ./configure \
    --prefix=$INSTALL_ROOT/usr \
    --with-x \
    --with-pthreads \
    --enable-xft \
    --enable-freetype2 \
    --enable-reorder \
    --enable-cpp-rtti \
    --enable-strip \
    --enable-optimize="$CFLAGS" \
    --with-default-mozilla-five-home=$MOZILLA_HOME \
    --enable-extensions=all${MOZILLA_EXT} \
    --disable-debug \
    --disable-tests \
    --disable-installer \
    --disable-pedantic  \
    $OPTS &&

# fix a problem of enigmail not compiling
# because S/MIME IDL files are not exported
  if ! make export; then
    pushd mailnews/extensions/smime/public &&
    make export &&
    popd &&
    make export
  fi &&

  make &&
  make_crypto &&

  prepare_install &&

# everything coming into /usr/lib/mozilla-$VERSION/
# must actually go to /usr/lib/mozilla/
  mkdir -p $MOZILLA_HOME &&
  ln -fns $MOZILLA_HOME $MOZILLA_HOME-$VERSION &&
  mkdir -p /usr/share/idl/mozilla &&
  ln -fns /usr/share/idl/mozilla /usr/share/idl/mozilla-$VERSION &&
  mkdir -p /usr/include/mozilla &&
  ln -fns /usr/include/mozilla /usr/include/mozilla-$VERSION &&

  make install &&
  make_crypto install  &&

  if  !  grep  -q  "mozilla"  /etc/ld.so.conf
  then
    echo  "/usr/lib/mozilla"  >>  /etc/ld.so.conf
  fi

) >$C_FIFO 2>&1
