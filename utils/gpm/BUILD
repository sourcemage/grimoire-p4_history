(

  ./configure  --prefix=/usr  $OPTS                  &&
  sedit  "s/src doc contrib/src contrib/"  Makefile  &&
  make                                               &&
  prepare_install                                    &&
  make    install				     &&
  cp $SPELL_CONFIG /etc/sysconfig/mouse
) > $C_FIFO 2>&1
