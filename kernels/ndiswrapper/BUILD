(

  export KVER=$(installed_version linux) &&
  CC=gcc make &&
  prepare_install &&
  make install &&
  mkdir -p /etc/ndiswrapper

) >$C_FIFO 2>&1
