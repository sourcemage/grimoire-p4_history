(

  patch  -p1  <  ${SCRIPT_DIRECTORY}/gcc-3.3.patch  &&

  echo /usr >conf-home  &&
  make                  &&
  prepare_install       &&
  make setup check

) > $C_FIFO 2>&1
