(

  patch -p1 < $SCRIPT_DIRECTORY/Makefile.diff &&

  ./buildconf --with-apr=/usr/share/apache2 &&

  ./configure \
    --host=$HOST \
    --build=$BUILD \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-layout=GNU \
    $OPTS &&
  make &&
  prepare_install &&
  make install

) >$C_FIFO 2>&1
