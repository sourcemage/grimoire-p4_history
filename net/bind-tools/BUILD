(

  ./configure  --prefix=/usr           \
               --localstatedir=/var    \
               $OPTS                   &&
  make -C lib/dns                      &&
  make -C lib/isc                      &&
  cd bin/dig                           &&
  make                                 &&
  prepare_install                      &&
  make install

) > $C_FIFO 2>&1
