(

  ./configure \
    --host=$HOST \
    --build=$BUILD \
    --prefix=/usr/lib/oz \
    --bindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-opt=yes \
    --enable-threaded \
    --enable-fastreg \
    --enable-regopt \
    --disable-modules-static \
    --enable-contrib \
    --disable-chm \
    $OPTS &&
  make &&
  prepare_install &&
  make install

) >$C_FIFO 2>&1
