(

  patch  -p1  <  ${SCRIPT_DIRECTORY}/gcc-3.3.patch  &&
  sedit  "s/-O2/$CFLAGS/"  Makefile                 &&

  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
