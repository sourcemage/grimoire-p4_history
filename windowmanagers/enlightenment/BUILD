(

  sedit  "s/@ENLIGHTENMENT_BIN@/\/usr\/bin/"  scripts/enlightenment.install.in

  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
               --enable-fsstd     \
               $OPTS              &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1
