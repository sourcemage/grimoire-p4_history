(

  # Determine which DBM should be considered the default
  DBM="sdbm"        # sdbm is the dbm bundled with apr-util
  if  spell_installed  gdbm  ;  then  DBM=gdbm  ;  fi
  if  spell_installed  db    ;  then  DBM=db    ;  fi
  OPTS="$OPTS --with-dbm=$DBM"

  ./buildconf --with-apr=/usr/share/apache2 &&

  ./configure \
    --host=$HOST \
    --build=$BUILD \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-layout=GNU \
    $OPTS &&
  make &&
  prepare_install &&
  make install

) >$C_FIFO 2>&1
