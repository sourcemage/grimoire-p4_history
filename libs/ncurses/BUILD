(

  patch  -p0  <  $SCRIPT_DIRECTORY/ncurses-ada-fix.patch  &&

  ./configure  --build=$BUILD                \
               --prefix=${INSTALL_ROOT}/usr  \
               --libdir=${INSTALL_ROOT}/lib  \
               --with-normal                 \
               --with-shared                 \
               --disable-termcap             \
	       $OPTS		             &&
  make                                       &&
  prepare_install                            &&
  make    install

) > $C_FIFO 2>&1
