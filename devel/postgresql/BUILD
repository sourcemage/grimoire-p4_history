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
  
  if    [  "$POSTGRES_BOOT"  =  "y"  ]
  then  cp  $SCRIPT_DIRECTORY/postgres.sh  /etc/init.d          &&
        ln  -sf  ../init.d/postgres.sh  /etc/rc0.d/K10postgres  &&
        ln  -sf  ../init.d/postgres.sh  /etc/rc6.d/K10postgres  &&
        ln  -sf  ../init.d/postgres.sh  /etc/rc3.d/S90postgres  &&
        ln  -sf  ../init.d/postgres.sh  /etc/rc4.d/S90postgres  &&
        ln  -sf  ../init.d/postgres.sh  /etc/rc5.d/S90postgres  &&

        mkdir  -p  /var/lib/postgres    &&
        touch      /var/log/postgres    &&
        chown  postgres.postgres  /var/lib/postgres  /var/log/postgres
  fi

) > $C_FIFO 2>&1
