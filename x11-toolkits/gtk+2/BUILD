(
  export CPPFLAGS="$CPPFLAGS -I/usr/include/libpng12"
  default_build  &&
  install -m 755 -d /etc/gtk-2.0  &&
  gdk-pixbuf-query-loaders > ${INSTALL_ROOT}/etc/gtk-2.0/gdk-pixbuf.loaders
) > $C_FIFO 2>&1
