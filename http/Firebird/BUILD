(
 # No fast optimization for Mozilla, bit us so many times...
 export  CFLAGS="${CFLAGS//-O3/-O2}"     &&
 export  CXXFLAGS="${CXXFLAGS//-O3/-O2}" &&

MOZILLA_HOME=${INSTALL_ROOT}/usr/lib/mozilla &&
MOZI_VERS=1.5b                               &&
export MOZ_PHOENIX=1                         &&

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
# everything coming into /usr/lib/mozilla-$MOZI_VERS/
# must actually go to /usr/lib/mozilla/
# TODO: work out what it uses to decide it's installdir ?
# I know it uses mozilla HEAD naming but what variable is that?

  mkdir -p $MOZILLA_HOME                           &&
  ln -fns $MOZILLA_HOME $MOZILLA_HOME-$MOZI_VERS   &&
  mkdir -p ${INSTALL_ROOT}/usr/share/idl/mozilla   &&
  ln -fns ${INSTALL_ROOT}/usr/share/idl/mozilla ${INSTALL_ROOT}/usr/share/idl/mozilla-$MOZI_VERS &&
  mkdir -p ${INSTALL_ROOT}/usr/include/mozilla     &&
  ln -fns ${INSTALL_ROOT}/usr/include/mozilla ${INSTALL_ROOT}/usr/include/mozilla-$MOZI_VERS     &&

  make install                                     && 
  ln -fns ${INSTALL_ROOT}/usr/bin/MozillaFirebird ${INSTALL_ROOT}/usr/bin/mozilla
  
) >$C_FIFO 2>&1
