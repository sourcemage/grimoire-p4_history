(

  OPTS="$OPTS --prefix=/usr"
  OPTS="$OPTS $CFG_debug $CFG_voc $CFG_wav $CFG_raw $CFG_aiff"
  OPTS="$OPTS $CFG_shn $CFG_midi"

  ./configure $OPTS  &&
  make               &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1
