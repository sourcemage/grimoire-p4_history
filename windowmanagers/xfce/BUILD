(
  export CPPFLAGS="-I/usr/include/freetype2" &&
  ./configure  --prefix=/usr         \
               --datadir=/usr/share  \
               --enable-xft=yes      \
               --sysconfdir=/etc     \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
