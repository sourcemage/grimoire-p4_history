(

  if spell_installed gdbm 
  then
    GDBM="--with-gdbm"
  else
    GDBM="--without-gdbm"
  fi

  ./configure $GDBM --prefix=/usr --with-httpddir=/usr/doc/hypermail/docs --sysconfdir=/etc &&

  make                          &&

  prepare_install               &&

  make install			

) > $C_FIFO 2>&1

