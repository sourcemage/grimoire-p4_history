(

  sedit "s/-O2/$CFLAGS/g" Makefile &&

  make LDFLAGS="$LDFLAGS" &&
  prepare_install &&
  make INSTALL_DIR="${INSTALL_ROOT}/usr" install &&
  make LOCALE_DIR="${INSTALL_ROOT}/usr" install-i18n &&

  if [ ! -f ${INSTALL_ROOT}/etc/fwlogwatch.config ] ; then
    install -m 644 fwlogwatch.config ${INSTALL_ROOT}/etc
  fi &&

  if [ ! -f ${INSTALL_ROOT}/etc/fwlogwatch.template ] ; then
    install -m 644 fwlogwatch.template ${INSTALL_ROOT}/etc
  fi

) > $C_FIFO 2>&1
