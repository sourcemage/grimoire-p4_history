local  MOZILLA_HOME  MOZ_PHOENIX  MOZ_INTERNAL_LIBART_LGPL  &&
MOZILLA_HOME=${INSTALL_ROOT}/usr/lib/mozilla                &&
export  MOZ_PHOENIX=1                                       &&

# No fast optimization for Mozilla, bit us so many times...
export  CFLAGS="${CFLAGS//-O3/-O2}"      &&
export  CXXFLAGS="${CXXFLAGS//-O3/-O2}"  &&

if  [  -f  /root/.mozconfig  ];  then
  rm  -f  /root/.mozconfig
fi  &&

if  [  "$FIREFOX_SVG"  =  "y"  ];  then
  OPTS="$OPTS  --enable-svg  --enable-svg-renderer-libart"  &&
  export  MOZ_INTERNAL_LIBART_LGPL=1
fi  &&

./configure                                       \
  --prefix=${INSTALL_ROOT}/usr                    \
  --with-x                                        \
  --with-pthreads                                 \
  --enable-reorder                                \
  --enable-cpp-rtti                               \
  --enable-strip                                  \
  --enable-optimize="$CFLAGS"                     \
  --with-default-mozilla-five-home=$MOZILLA_HOME  \
  --disable-debug                                 \
  --disable-tests                                 \
  --disable-installer                             \
  --disable-pedantic                              \
  --disable-mailnews                              \
  --disable-composer                              \
  --enable-crypto                                 \
  --enable-extensions                             \
  --enable-single-profile                         \
  $OPTS                                           &&
make
