(

#  sedit  's/$(CC) $(CFLAGS) -o/$(CC) $(CFLAGS) $(LDFLAGS) -o/'  Makefile
# make  LDFLAGS="-s -static"     &&

  rm -vf /usr/bin/bzgrep
  rm -vf /usr/bin/bzegrep
  rm -vf /usr/bin/bzfgrep
  rm -vf /usr/bin/bzless
  rm -vf /usr/bin/bzcmp

  sedit  "s/-O2/$CFLAGS/"  Makefile

  make  PREFIX=/usr             &&
  prepare_install               &&
  make  PREFIX=/usr install     &&
  make  -f  Makefile-libbz2_so  &&
  rm -vf /usr/lib/libbz2.so* &&
  cp   libbz2.so.1.0.2 /usr/lib

) > $C_FIFO 2>&1
