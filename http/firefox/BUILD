(
 # No fast optimization for Mozilla, bit us so many times...
 export  CFLAGS="${CFLAGS//-O3/-O2}"     &&
 export  CXXFLAGS="${CXXFLAGS//-O3/-O2}" &&

if [ -f /root/.mozconfig ]
 then rm -f /root/.mozconfig
fi                                           &&
MOZILLA_HOME=${INSTALL_ROOT}/usr/lib/mozilla &&
if [ "$SVG" = "yes" ];
 then OPTS="$OPTS --enable-svg --enable-svg-renderer-libart" &&
 export MOZ_INTERNAL_LIBART_LGPL=1           
fi &&
export MOZ_PHOENIX=1                         &&
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
    --enable-native-uconv \
    --enable-extensions    \
    $OPTS               &&

    make                &&


  prepare_install                                  &&
  if spell_installed Firebird; then
  dispel Firebird
  fi                                               &&
# everything coming into /usr/lib/mozilla-$MOZI_VERS/
# must actually go to /usr/lib/mozilla/

  MOZI_VERS=$(grep MOZILLA_VERSION mozilla-config.h | cut -d\" -f2) &&
  mkdir -p $MOZILLA_HOME                           &&
  ln -fns $MOZILLA_HOME $MOZILLA_HOME-$MOZI_VERS   &&
  mkdir -p ${INSTALL_ROOT}/usr/share/idl/mozilla   &&
  ln -fns ${INSTALL_ROOT}/usr/share/idl/mozilla ${INSTALL_ROOT}/usr/share/idl/mozilla-$MOZI_VERS &&
  mkdir -p ${INSTALL_ROOT}/usr/include/mozilla     &&
  ln -fns ${INSTALL_ROOT}/usr/include/mozilla ${INSTALL_ROOT}/usr/include/mozilla-$MOZI_VERS     &&

  make install                                                   &&
  cp -vaL dist/public/nss  ${INSTALL_ROOT}/usr/include/mozilla/  &&
  ln -fns firefox ${INSTALL_ROOT}/usr/bin/mozilla                &&


  if  !  grep  -q  "mozilla"  /etc/ld.so.conf
  then
    echo  "/usr/lib/mozilla"  >>  /etc/ld.so.conf
  fi
  
) >$C_FIFO 2>&1
