(

  ./configure  $OPTS                 &&
  sedit "6690s/Screensaver/Screensaver Properties/" po/es.po
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
