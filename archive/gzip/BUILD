patch -p1 < $SCRIPT_DIRECTORY/gzip-1.2.4b.patch

(

  ./configure  --build=$BUILD  \
               --prefix=/usr   \
               --bindir=/bin   &&
  make                         &&
  prepare_install              &&
  make  bindir=/bin  install

) > $C_FIFO 2>&1
