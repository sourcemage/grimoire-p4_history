FIREFOX_HOME=${INSTALL_ROOT}/usr/lib/firefox                &&
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

if [ "$FIREFOX_CVS" == "y" ]; then
  OPTS="$OPTS --enable-application=browser"
fi &&
cp browser/config/mozconfig .mozconfig &&
./configure                                       \
  --prefix=${INSTALL_ROOT}/usr                    \
  --with-user-appdir=.firefox                     \
  --with-x                                        \
  --with-pthreads                                 \
  --enable-reorder                                \
  --enable-cpp-rtti                               \
  --enable-strip                                  \
  --enable-optimize="$CFLAGS"                     \
  --with-default-mozilla-five-home=$FIREFOX_HOME  \
  --disable-debug                                 \
  --disable-tests                                 \
  --disable-installer                             \
  --disable-pedantic                              \
  --disable-mailnews                              \
  --disable-composer                              \
  --enable-crypto                                 \
  --enable-single-profile                         \
  $OPTS                                           &&
make
