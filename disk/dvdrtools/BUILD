(

  ./configure  --build=${BUILD}      \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               ${OPTS}               &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  ln  -sf  /usr/bin/dvdrecord        \
           /usr/bin/cdrecord

) > ${C_FIFO} 2>&1
