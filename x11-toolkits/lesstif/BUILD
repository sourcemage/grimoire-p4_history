(
  sedit 's:/LessTif/doc:/doc:'  doc/Makefile.in  &&

  ./configure  --prefix=/usr       \
               --sysconfdir=/etc   \
               --enable-production \
               --disable-debug     \
               --enable-static     \
               --enable-build-12   \
               --enable-build-20   \
               --enable-build-21   \
               $OPTS               &&
  make                             &&
  prepare_install                  &&
  make    install
  
) > $C_FIFO 2>&1
