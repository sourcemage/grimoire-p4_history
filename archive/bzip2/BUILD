(

#  sedit  's/$(CC) $(CFLAGS) -o/$(CC) $(CFLAGS) $(LDFLAGS) -o/'  Makefile
# make  LDFLAGS="-s -static"     &&

  rm -vf ${INSTALL_ROOT}/usr/bin/bzgrep
  rm -vf ${INSTALL_ROOT}/usr/bin/bzegrep
  rm -vf ${INSTALL_ROOT}/usr/bin/bzfgrep
  rm -vf ${INSTALL_ROOT}/usr/bin/bzless
  rm -vf ${INSTALL_ROOT}/usr/bin/bzcmp

  sedit  "s/-O2/$CFLAGS/"  Makefile

  make  PREFIX=${INSTALL_ROOT}/usr             &&
  prepare_install               &&
  make  PREFIX=${INSTALL_ROOT}/usr install     &&
  make  -f  Makefile-libbz2_so  &&
  rm -vf ${INSTALL_ROOT}/usr/lib/libbz2.so* &&
  cp   libbz2.so.1.0.2 ${INSTALL_ROOT}/usr/lib

) > $C_FIFO 2>&1
