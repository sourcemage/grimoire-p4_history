(

  sedit  "s/-O/$CFLAGS/"  Makefile.in

  ./configure  --prefix=${INSTALL_ROOT}/usr              \
               --infodir=${INSTALL_ROOT}/usr/share/info  \
               --mandir=${INSTALL_ROOT}/usr/share/man    \
               $OPTS                &&
  make                              &&
  prepare_install                   &&
  make  prefix=${INSTALL_ROOT}/usr install         &&
  make  prefix=${INSTALL_ROOT}/usr install-compat  &&
  ln    -sf  libgdbm.so.3.0.0     ${INSTALL_ROOT}/usr/lib/libndbm.so  &&
  ln    -sf  ${INSTALL_ROOT}/usr/lib/libgdbm.la  ${INSTALL_ROOT}/usr/lib/libndbm.la  &&
  ln    -sf  ${INSTALL_ROOT}/usr/lib/libgdbm.a   ${INSTALL_ROOT}/usr/lib/libndbm.a

) > $C_FIFO 2>&1
