(

  sedit  "s/\/local//"  Makefile.conf
  ./configure                    &&
  make                           &&
  prepare_install                &&
  make    install                &&
  install  -m 644  client/dhclient.conf  /etc/dhclient.conf.example  &&
  install  -m 644  server/dhcpd.conf  /etc/dhcpd.conf.example

) > $C_FIFO 2>&1
