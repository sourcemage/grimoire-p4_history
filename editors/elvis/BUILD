(

  sedit  "s/-O2/$CFLAGS/"  configure      &&
  ./configure  --build=$BUILD             \
               --bindir=/usr/bin          \
               --libs=/lib/libncurses.so  \
               --datadir=/var/lib/elvis   &&
  make                                    &&
  prepare_install                         &&
  make    install                         &&
  ln  -sf  elvis  /usr/bin/vi

) > $C_FIFO 2>&1
