(

  OLD_CFLAGS="-Wall -O6 -fomit-frame-pointer -funroll-loops"
  sedit  "s/$OLD_CFLAGS/$CFLAGS/"  iv/Makefile

  cd  iv           &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
