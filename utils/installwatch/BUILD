(

  patch  -p1  <  ${SCRIPT_DIRECTORY}/ld_preload.patch                 &&
  sedit  "s:PREFIX=/usr/local:PREFIX=${INSTALL_ROOT}/usr:"  Makefile  &&
  sedit  "s/gcc /gcc $CFLAGS /"              Makefile                 &&

  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
