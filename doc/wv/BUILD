(

  if    spell_installed  libwmf;
  then
    LIBWMF=--with-libwmf;
  fi

  ./configure  --prefix=/usr    \
               $LIBWMF          &&
  make                          &&
  prepare_install               &&
  make    install

) > $C_FIFO 2>&1
