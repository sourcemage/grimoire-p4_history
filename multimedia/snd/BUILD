(
  OPTS="$OPTS --prefix=/usr"
  OPTS="$OPTS $CFG_alsa $CFG_gtk $CFG_ruby $CFG_doubles $CFG_float $CFG_run"

  ./configure $OPTS &&
  make &&
  make install

) > $C_FIFO 2>&1
