(

  # this is necessary for wxPython to compile
  patch -p0 < $SCRIPT_DIRECTORY/setmenu.diff &&

  # --x-libraries doesn't work :-(
  export LIBS="$LIBS -L/usr/X11R6/lib" &&
  ./configure \
    --host=$HOST \
    --build=$BUILD \
    --prefix=/usr \
    --sysconfdir=/etc  \
    --localstatedir=/var  \
    --enable-optimise \
    --disable-debug \
    --enable-shared \
    --with-opengl \
    --enable-geometry \
    --with-x \
    $OPTS &&
  make &&
  prepare_install &&
  make install

) >$C_FIFO 2>&1
