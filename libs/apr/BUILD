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

) >$C_FIFO 2>&1 
