(

  ./configure  --prefix=/usr         \
               --datadir=/usr/share  \
               --enable-xft=yes      \
               --sysconfdir=/etc     &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
