(
  patch src/shar.c < $SPELL_DIRECTORY/sharutils-4.3.75.bufferoverflowfix.patch &&
  ./configure  --prefix=${INSTALL_ROOT}/usr       \
               --with-gnu-gettext  \
	       $OPTS		   &&
  make                             &&
  prepare_install                  &&
  make    install

) > $C_FIFO 2>&1
