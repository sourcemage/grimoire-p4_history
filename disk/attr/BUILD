(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                        &&
  prepare_install             &&
  make    install             &&
  make    install-dev         &&

  # Why doesn't version 2.0.1 copy this library to where it belongs?

  cp      libattr/.libs/libattr.so.1.1.0 /usr/lib          &&
  ln  -sf  /usr/lib/libattr.so.1.1.0  /usr/lib/libattr.so

)  >  $C_FIFO  2>&1
