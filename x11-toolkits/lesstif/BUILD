(
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
  make    install                  &&
### sorcery has trouble tracking mv-ed files ?
  rm  -rf  /usr/doc/LessTif/        &&
  cp  -af /usr/LessTif/  /usr/doc/LessTif/ &&
  rm  -rf  /usr/LessTif/
  
) > $C_FIFO 2>&1
