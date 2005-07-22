(

  ./configure                     \
    --prefix=${INSTALL_ROOT}/usr  \
    $OPTS                      &&
  make                         &&
  make docs                    &&
  prepare_install              &&
  make    install              &&
  make install-docs            &&

  if [ ! -f ${INSTALL_ROOT}/etc/chrony.conf ]
  then
    cp  $SCRIPT_DIRECTORY/chrony.conf   ${INSTALL_ROOT}/etc/
  fi

) > $C_FIFO 2>&1
