(

  ./configure  --build=$BUILD                       \
               --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               $OPTS                                &&
  make                                              &&
  prepare_install                                   &&

  cp        less          ${INSTALL_ROOT}/bin           &&
  cp        lessecho      ${INSTALL_ROOT}/usr/bin       &&
  cp        lesskey       ${INSTALL_ROOT}/usr/bin       &&

  mv        less.nro      less.1                        &&
  gzip  -9  less.1                                      &&
  cp        less.1.gz     ${INSTALL_ROOT}/usr/man/man1  &&

  mv        lesskey.nro   lesskey.1                     &&
  gzip  -9  lesskey.1                                   &&
  cp        lesskey.1.gz  ${INSTALL_ROOT}/usr/man/man1

) > $C_FIFO 2>&1
