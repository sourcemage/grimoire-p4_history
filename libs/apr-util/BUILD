(

  # Determine which DBM should be considered the default
  DBM="sdbm"        # sdbm is the dbm bundled with apr-util
  if  spell_installed  gdbm  ;  then  DBM=gdbm  ;  fi
  if  spell_installed  db    ;  then  DBM=db    ;  fi

  # So headers are installed in the right place
  sedit  's/apache2/apr/'  configure  &&

  OPTS="$OPTS --enable-layout=GNU --with-apr=/usr --with-dbm=$DBM"
  default_build

) > $C_FIFO 2>&1
