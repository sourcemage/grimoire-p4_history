(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&

  sedit  "s:CFLAGS = -g -O0 :CFLAGS = ${CFLAGS} -g :"  Makefile  &&

  make                               &&
  prepare_install                    &&
  make    install

)  >  $C_FIFO  2>&1
