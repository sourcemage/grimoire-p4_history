(

  patch -p1 < $SCRIPT_DIRECTORY/build.diff &&
  if ! [ -x configure ]; then
    ./buildconf
  fi &&

  ./configure \
    --host=$HOST \
    --build=$BUILD \
    --prefix=/usr \
    --includedir=/usr/include/apr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-layout=GNU \
    --enable-threads \
    $OPTS &&
  make &&
  prepare_install &&
  make install &&
  ln -fns ./build/libtool /usr/share/apache2/libtool  &&

  if [ "$APR_CHECKOUT" == 'y' ]; then
    cp  $SOURCE_DIRECTORY/build/gen-build.py  \
        /usr/share/apache2/build
  fi

) >$C_FIFO 2>&1 && (

  FIX_PATH_REGEX='s|/usr/src/apr-[^/"]*|/usr/share/apache2|' &&
  sedit $FIX_PATH_REGEX /usr/bin/apr-config  &&
  sedit $FIX_PATH_REGEX /usr/share/apache2/build/apr_rules.mk

)
