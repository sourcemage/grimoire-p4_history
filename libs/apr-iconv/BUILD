(

  patch -p1 < $SCRIPT_DIRECTORY/Makefile.diff &&
  patch -p1 < $SCRIPT_DIRECTORY/iconv_stream.h.diff && # remove with Apache 2.0.47

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
