(

  ./configure  --build=$BUILD  \
               --prefix=${INSTALL_ROOT}/usr   \
               --infodir=${INSTALL_ROOT}/usr/share/info \
               --mandir=${INSTALL_ROOT}/usr/share/man   \
	       $OPTS	       &&
  make                         &&
  prepare_install              &&
  make    install              &&
  make  -e TEXMF=$DEST_DIR${INSTALL_ROOT}/usr/share/texmf install-tex

) > $C_FIFO 2>&1
