(

  ./configure  --build=$BUILD                \
               --prefix=${INSTALL_ROOT}/usr  \
               --libdir=${INSTALL_ROOT}/lib  \
               --with-normal                 \
               --with-shared                 \
               --disable-termcap             \
	       $OPTS		             &&
  make                                       &&
  prepare_install                            &&
  make install                               &&
  if ! [ -h ${INSTALL_ROOT}/lib/libcurses.so ]
  then ln -sf libncurses.so ${INSTALL_ROOT}/lib/libcurses.so &&
       ln -sf libncurses.a ${INSTALL_ROOT}/lib/libcurses.a
  fi                                         &&
  if [ "$CROSS_INSTALL" = "on" ]
  then mv -f ${INSTALL_ROOT}/usr/include/ncurses/* ${INSTALL_ROOT}/usr/include/ &&
       rm -rf ${INSTALL_ROOT}/usr/include/ncurses
  fi
) > $C_FIFO 2>&1
