(
  make                         &&
  prepare_install              &&
  # Do not make libsafe default 
  # - conflicts with installwatch because installwatch is badly written
  echo n | make  bindir=/bin  install

) > $C_FIFO 2>&1
