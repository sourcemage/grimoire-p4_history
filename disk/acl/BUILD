(

  ./configure  --build=${BUILD}      \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               ${OPTS}               &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  make    install-dev                &&

  # Why doesn't 'make install' copy this library to where it belongs?

  cp      libacl/.libs/libacl*  /usr/lib

)  >  ${C_FIFO}  2>&1
