(

  ./configure  --prefix=/usr      &&
  make                            &&
  make  install                   &&

  install  -m 644 tftpd/sample.rules  /etc/tftpd.rules

) > $C_FIFO 2>&1
