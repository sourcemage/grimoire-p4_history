(

  make                         &&
  prepare_install              &&
  install -m 755 bin.linuxx86/jam /usr/bin/jam &&
  install -D -m 444 RELNOTES /usr/doc/jam/RELNOTES &&
  chmod  a-s  /usr/bin/jam

) > $C_FIFO 2>&1
