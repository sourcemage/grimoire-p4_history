MOZILLA_HOME=$INSTALL_ROOT/usr/lib/mozilla    &&

# No fast optimization for Mozilla, bit us so many times...
CFLAGS="${CFLAGS//-O3/-O2}"      &&
CXXFLAGS="${CXXFLAGS//-O3/-O2}"  &&

./configure \
  --prefix=$INSTALL_ROOT/usr \
  --mandir=$INSTALL_ROOT/usr/share/man \
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

make_single  &&
make
