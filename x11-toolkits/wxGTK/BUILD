function do_subdir() {
  pushd $1 >/dev/null &&
  $2 &&
  popd >/dev/null
}

(

  #patch  -p1  <  $SCRIPT_DIRECTORY/gtk-2.4-fix.patch  &&
  # --x-libraries doesn't work :-(
  # export LIBS="$LIBS -L/usr/X11R6/lib" &&
  ./configure \
    --host=$HOST \
    --build=$BUILD \
    --prefix=${INSTALL_ROOT}/usr \
    --sysconfdir=${INSTALL_ROOT}/etc  \
    --localstatedir=${INSTALL_ROOT}/var  \
    --enable-optimise \
    --disable-debug \
    --enable-shared \
    --with-opengl \
    --with-libiconv-prefix=${INSTALL_ROOT}/usr \
    --enable-geometry \
    $OPTS &&
  make &&
  do_subdir contrib/src/stc make &&
  do_subdir contrib/src/xrc make &&

  prepare_install &&
  make install &&
  do_subdir contrib/src/stc "make install" &&
  do_subdir contrib/src/xrc "make install"

) >$C_FIFO 2>&1
