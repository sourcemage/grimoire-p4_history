(

  if  !  spell_installed  xfree86;  then
    OMIT_X11="--without-x11"
  fi
  rm  -r  dialog

  patch  -p1  <  $SCRIPT_DIRECTORY/teTeX.patch
  patch  -p0  <  $SCRIPT_DIRECTORY/web2c.patch

  # teTeX doesn't compile when doing more than one thing at once
  MAKE_NJOBS=1

  ./configure  --prefix=/usr            \
               --with-system-zlib       \
               --with-system-pnglib     \
               --with-system-ncurses    \
               --with-system-libwww     \
               --with-system-ncurses    \
               --without-texinfo        \
               --without-dialog         \
               --disable-multiplatform  \
               $OMIT_X11                &&
  make  all                             &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1
