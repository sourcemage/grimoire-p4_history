(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
							 --enable-grace-home=/usr/share/grace  \
               $OPTS                 && 
  make                               &&
  prepare_install                    &&
  make    install                    &&
  cp  /usr/share/grace/bin/*  /usr/bin

) > $C_FIFO 2>&1
