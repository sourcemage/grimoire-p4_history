(

  ./configure                  \
    --prefix=/usr              \
    $OPTS                      &&
  make                         &&
  make docs                    &&
  prepare_install              &&
  make    install              &&
  make install-docs            &&

  if [ ! -f /etc/chrony.conf ]
  then
    cp  $SCRIPT_DIRECTORY/chrony.conf   /etc/
  fi

) > $C_FIFO 2>&1
