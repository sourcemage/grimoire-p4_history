(

  ./configure  --prefix=/usr \
  --sysconfdir=/etc          \
  --localstatedir=/var	     \
  --enable-ne2000            \
  --enable-fpu               \
  --enable-cdrom=yes         \
  --with-x11                 \
  --enable-sb16=linux        &&
  make                       &&
  prepare_install            &&
  make    install            

) > $C_FIFO 2>&1
