(

  ./configure  --prefix=/usr       \
               --sysconfdir=/etc   \
               --enable-production \
               --disable-debug     \
               --enable-static     \
               $OPTS               &&
  make                             &&
  prepare_install                  &&
  make    install                  &&
  rm  -rf  /usr/doc/LessTif        &&
  mv  /usr/LessTif  /usr/doc

) > $C_FIFO 2>&1
