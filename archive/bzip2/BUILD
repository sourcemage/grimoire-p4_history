(

#  sedit  's/$(CC) $(CFLAGS) -o/$(CC) $(CFLAGS) $(LDFLAGS) -o/'  Makefile
# make  LDFLAGS="-s -static"     &&


  sedit  "s/-O2/$CFLAGS/"  Makefile

  make  PREFIX=/usr             &&
  prepare_install               &&
  make  PREFIX=/usr install     &&
  make  -f  Makefile-libbz2_so  &&
  cp    -a  libbz2.so* /usr/lib

) > $C_FIFO 2>&1
