(

  if  !  spell_installed  xfree86;  then
    OMIT_X11="--without-x11"
  fi                                    &&
  rm  -r  dialog                        &&
  ./configure  --prefix=/usr            \
               --with-system-zlib       \
               --with-system-pnglib     \
               --with-system-ncurses    \
               --with-system-libwww     \
               --with-system-ncurses    \
               --without-texinfo        \
               --without-dialog         \
               --disable-multiplatform  \
	       $OPTS			\
               $OMIT_X11                &&
  make  all                             &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1
