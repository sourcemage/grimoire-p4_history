(

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

  sedit 's|[^_]off64_t| __off64_t|' include/apr.h &&

  make &&
  prepare_install &&
  make install &&
  ln -fns ./build/libtool /usr/share/apache2/libtool 

) >$C_FIFO 2>&1 
