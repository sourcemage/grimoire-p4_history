(
# their package uses old gettext, let's fix it
  cp /usr/share/gettext/po/Makefile.in.in po	&&
  autoconf					&&
  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
  make                   &&
  prepare_install        &&
  make    install        

) > $C_FIFO 2>&1
