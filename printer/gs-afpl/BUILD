(

  [[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

  ./configure  --prefix=${INSTALL_ROOT}/usr                                   \
               --sysconfdir=${INSTALL_ROOT}/etc                               \
               --localstatedir=${INSTALL_ROOT}/var                            \
               --mandir=${INSTALL_ROOT}/usr/share/man                         \
               --infodir=${INSTALL_ROOT}/usr/share/info                       \
               $OPTS                                                          &&

  make                                                                        &&

  if  grep  -q  "LIBGS=y"  $SPELL_CONFIG;  then
    make  so
  fi                                                                          &&

  prepare_install                                                             &&
  make    install                                                             &&

  if  grep  -q  "LIBGS=y"  $SPELL_CONFIG;  then
    make  soinstall
  fi

) > $C_FIFO 2>&1
