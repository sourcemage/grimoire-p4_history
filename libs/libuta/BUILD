(

  patch  -p1  <  ${SCRIPT_DIRECTORY}/gcc-3.3.patch  &&

  ./configure  --prefix=/usr        \
               --sysconfdir=/etc    \
               --localstatedir=/var \
               --disable-debug      \
               $OPTS                &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
