(

  ./configure  $OPTS  &&
  make  xvattr        &&
  if  spell_installed  gtk+;  then
    make gxvattr
  fi  &&
  prepare_install  &&
  (
    install  -m 755  xvattr    ${INSTALL_ROOT}/usr/bin             &&
    install  -m 644  xvattr.1  ${INSTALL_ROOT}/usr/share/man/man1  &&
    [ -x gxvattr ] && install  -m 755  gxvattr  ${INSTALL_ROOT}/usr/bin || true
  )

) > $C_FIFO 2>&1
