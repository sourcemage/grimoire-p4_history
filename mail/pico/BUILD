(

  if  spell_installed  openssl;  then

    if    spell_installed  Linux-PAM
    then  ./build  DEBUG="$CFLAGS"  NOSSL=unix  SSLCERTS=/etc/ssl/certs  SSLINCLUDE=/usr/include/openssl  SSLLIB=/usr/lib  lnp
    else  ./build  DEBUG="$CFLAGS"  NOSSL=unix  SSLCERTS=/etc/ssl/certs  SSLINCLUDE=/usr/include/openssl  SSLLIB=/usr/lib  slx
    fi  &&
    prepare_install

  else

    if    spell_installed  Linux-PAM
    then  ./build  DEBUG="$CFLAGS"  lnp
    else  ./build  DEBUG="$CFLAGS"  slx
    fi  &&
    prepare_install

  fi


) > $C_FIFO 2>&1  &&  (

  cd  bin
  cp  pico    /usr/bin
  cd  ../doc

  for  MANPAGE  in  `ls  pico*.1`;  do
    gzip  -9  $MANPAGE
    cp  $MANPAGE.gz  /usr/man/man1
  done

)
