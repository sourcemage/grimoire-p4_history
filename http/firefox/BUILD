MOZILLA_HOME=${INSTALL_ROOT}/usr/lib/mozilla &&
export MOZ_PHOENIX=1                         &&

# Patches for freetype 2.1.8 and gcc 3.4
patch -p0 < $SCRIPT_DIRECTORY/freetype.patch &&
# patch -p0<$SCRIPT_DIRECTORY/nsRegion.patch

# No fast optimization for Mozilla, bit us so many times...
export  CFLAGS="${CFLAGS//-O3/-O2}"     &&
export  CXXFLAGS="${CXXFLAGS//-O3/-O2}" &&

if [ -f /root/.mozconfig ]
 then rm -f /root/.mozconfig
fi                                           &&
if [ "$SVG" = "yes" ];
  then OPTS="$OPTS --enable-svg --enable-svg-renderer-libart" &&
  export MOZ_INTERNAL_LIBART_LGPL=1           
fi &&
#  --enable-single-profile \
./configure         \
  --prefix=${INSTALL_ROOT}/usr    \
  --with-x            \
  --with-pthreads     \
  --enable-reorder    \
  --enable-cpp-rtti   \
  --enable-strip      \
  --enable-optimize="$CFLAGS"   \
  --with-default-mozilla-five-home=$MOZILLA_HOME \
  --disable-debug     \
  --disable-tests     \
  --disable-installer \
  --disable-pedantic  \
  --disable-mailnews  \
  --disable-composer  \
  --enable-crypto     \
  --enable-extensions \
  $OPTS               &&
make
