(

  ./configure  --with-sys-screenrc=/etc/screenrc  \
               --prefix=/usr                      \
               $OPTS			          &&
  make                                            &&
  prepare_install                                 &&
  make    install                                 &&
  cp  etc/etcscreenrc /etc/screenrc

) > $C_FIFO 2>&1
