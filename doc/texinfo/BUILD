(

  ./configure  --build=$BUILD  \
               --prefix=/usr   \
	       $OPTS	       &&
  make                         &&
  prepare_install              &&
  make    install              &&
  make  -e TEXMF=$DEST_DIR/usr/share/texmf install-tex

) > $C_FIFO 2>&1
