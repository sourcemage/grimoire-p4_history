(

  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --enable-redhat       \
               --enable-fhs          \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  mkdir  -p  /etc/netatalk           &&
  make    install

) > $C_FIFO 2>&1
