(

  ./configure  --build=${BUILD}              \
               --prefix=${INSTALL_ROOT}/usr  \
               --bindir=${INSTALL_ROOT}/bin  \
               --infodir=${INSTALL_ROOT}/usr/share/info \
               --mandir=${INSTALL_ROOT}/usr/share/man   \
               ${OPTS}                       &&
  make                                       &&
  prepare_install                            &&
  make    install                            &&
  rm  -f         ${INSTALL_ROOT}/bin/awk     &&
  ln  -sf  gawk  ${INSTALL_ROOT}/bin/awk

) > ${C_FIFO} 2>&1
