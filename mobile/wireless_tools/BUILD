(

  sedit  "s/-O2/$CFLAGS/"  Makefile
  make                                                     &&
  prepare_install                                          &&
  cp  iwconfig iwgetid iwlist iwspy iwpriv iwevent /usr/sbin      &&
  cp  iwconfig.8 iwlist.8 iwspy.8 iwpriv.8 iwevent.8 /usr/man/man8  &&
  cp  libiw.so.${VERSION}  /usr/lib                        &&
  cp  iwlib.h  /usr/include                                    &&
  ln  -s /usr/lib/libiw.so.${VERSION}  /usr/lib/libiw.so

) > $C_FIFO 2>&1
