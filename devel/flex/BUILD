(

  ./configure  --host=$HOST                   \
               --build=$BUILD                 \
               --prefix=${INSTALL_ROOT}/usr   \
               --infodir=${INSTALL_ROOT}/usr/share/info \
               --mandir=${INSTALL_ROOT}/usr/share/man   \
               --disable-nls   \
               $OPTS           &&
  make                         &&
  prepare_install              &&
  make    install              &&
  ln  -sf  flex  ${INSTALL_ROOT}/usr/bin/lex

) > $C_FIFO 2>&1
