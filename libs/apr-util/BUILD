(

  ./configure \
    --host=$HOST \
    --build=$BUILD \
    --prefix=/usr \
    --includedir=/usr/include/apr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-layout=GNU \
    $OPTS &&
  make &&
  prepare_install &&
  make install

) >$C_FIFO 2>&1 
