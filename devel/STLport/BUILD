(

  cd  src
  sedit  "s:/usr/local:/usr:"  common_macros.mak
  make   -f gcc.mak  clean  all  &&
  prepare_install                &&
  make   -f gcc.mak  install

) > $C_FIFO 2>&1

