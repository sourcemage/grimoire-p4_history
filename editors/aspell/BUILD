(

  touch /root/.aspell.conf           &&
  touch /etc/aspell.conf             &&
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make install  

) > $C_FIFO 2>&1
