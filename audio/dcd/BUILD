(
  cp    Makefile  Makefile.original
  sed   "s/NET = true/# NET = true/"                <  Makefile.original  |
  sed   "s/UNKNOWN_CD = true/# UNKNOWN_CD = true/"  >  Makefile

  make  PREFIX=/usr  &&
  prepare_install    &&
  make  PREFIX=/usr install

) > $C_FIFO 2>&1
