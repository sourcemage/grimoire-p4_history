(

  if    spell_installed  apache  ||
        spell_installed  apache-mod_ssl
  then  WITH_APACHE="--with-apxs"
  fi

  ./configure  --prefix=/usr                 \
               --sysconfdir=/etc             \
               --with-config-file-path=/etc  \
               $WITH_APACHE                  \
               $OPTS                         &&
  make                                       &&
  prepare_install                            &&
  make    install                            &&
  if    !   [  -e         /etc/php.ini  ]
  then  cp  php.ini-dist  /etc/php.ini
  fi

) > $C_FIFO 2>&1
