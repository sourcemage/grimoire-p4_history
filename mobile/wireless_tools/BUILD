(

  sedit  "s/-O2/$CFLAGS/"  Makefile
  make                                                     &&
  prepare_install                                          &&
  cp  iwconfig iwgetid iwlist iwspy iwpriv  /usr/sbin      &&
  cp  iwconfig.8 iwlist.8 iwspy.8 iwpriv.8  /usr/man/man8  &&
  cp  libiw.so.23  /usr/lib                                &&
  ln  -s /usr/lib/libiw.so.23  /usr/lib/libiw.so

) > $C_FIFO 2>&1
