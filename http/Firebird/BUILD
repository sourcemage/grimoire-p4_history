(
 # No fast optimization for Mozilla, bit us so many times...
 export  CFLAGS="${CFLAGS//-O3/-O2}"     &&
 export  CXXFLAGS="${CXXFLAGS//-O3/-O2}" &&

MOZILLA_HOME=${INSTALL_ROOT}/usr/lib/mozilla &&
export MOZ_PHOENIX=1       &&

    ./configure \
    --prefix=${INSTALL_ROOT}/usr    \
    --with-x            \
    --with-pthreads     \
    --enable-xft        \
    --enable-freetype2  \
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
    $OPTS               &&

    make                &&


  prepare_install &&
# everything coming into /usr/lib/mozilla-$VERSION/
# must actually go to /usr/lib/mozilla/
  mkdir -p $MOZILLA_HOME                         &&
  ln -fns $MOZILLA_HOME $MOZILLA_HOME-$VERSION   &&
  mkdir -p ${INSTALL_ROOT}/usr/share/idl/mozilla &&
  ln -fns ${INSTALL_ROOT}/usr/share/idl/mozilla ${INSTALL_ROOT}/usr/share/idl/mozilla-$VERSION &&
  mkdir -p ${INSTALL_ROOT}/usr/include/mozilla   &&
  ln -fns ${INSTALL_ROOT}/usr/include/mozilla ${INSTALL_ROOT}/usr/include/mozilla-$VERSION     &&

  make install

) >$C_FIFO 2>&1
