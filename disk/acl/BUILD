(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  make    install-dev                &&

  # Why doesn't version 2.0.0 copy this library to where it belongs?

  cp      libacl/.libs/libacl.so.1.0.3  /usr/lib

)  >  $C_FIFO  2>&1
