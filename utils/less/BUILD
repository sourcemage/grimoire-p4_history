(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  cp        less          /bin
  cp        lessecho      /usr/bin
  cp        lesskey       /usr/bin

  mv        less.nro      less.1
  gzip  -9  less.1
  cp        less.1.gz     /usr/man/man1

  mv        lesskey.nro   lesskey.1
  gzip  -9  lesskey.nro   lesskey.1
  cp        lesskey.1.gz  /usr/man/man1

)
