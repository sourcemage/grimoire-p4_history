(

  ./configure  --build=${BUILD}                     \
               --prefix=/usr                        \
               --sysconfdir=/etc                    \
               --localstatedir=/var                 \
               --with-gfx-incs=/usr/include/WINGs   \
               ${OPTS}                              &&

  sedit  "s:/usr/etc:/etc:g"  Makefile              &&

  make                                              &&
  prepare_install                                   &&
  make    install

)  >  ${C_FIFO}  2>&1
