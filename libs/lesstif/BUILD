(

  ./configure  --prefix=/usr       \
               --sysconfdir=/etc   \
               --enable-production \
               --disable-debug     \
               $OPTS               &&
  make                             &&
  prepare_install                  &&
  make    install                  &&
  rm  -rf  /usr/doc/LessTif        &&
  mv  /usr/LessTif  /usr/doc

) > $C_FIFO 2>&1
