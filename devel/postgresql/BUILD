(

  ./configure  --prefix=/usr            \
               --with-CXX               \
               $OPTS                    &&
  make                                  &&
  prepare_install                       &&
  make    install                       &&
  make    install-all-headers           &&
  cd      contrib/pgcrypto              &&
  make                                  &&
  make    install                       &&
  
 mkdir  -p  /var/lib/postgres           &&
 touch      /var/log/postgres           &&
 chown  postgres.postgres  /var/lib/postgres  /var/log/postgres

) > $C_FIFO 2>&1
