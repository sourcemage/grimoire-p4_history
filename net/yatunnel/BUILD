(

  sedit  "s/-Wall -g -O/$CFLAGS/"  Makefile

  make                                   &&
  prepare_install                        &&
  cp  tun-proxy   /usr/bin/tun-proxy     &&
  cp  tun-server  /usr/bin/tun-server

) > $C_FIFO 2>&1
