(

  unpack  $SOURCE2  ${MD5[1]}                         &&
  gunzip  -c  $SOURCE_CACHE/$SOURCE2  |  patch  -p1   &&

  sedit  '20,26 d'  include-glibc/netinet/in.h        &&

  make  TARGETS="ping ping6"                          &&
  prepare_install                                     &&
  install  ping  ping6  /usr/bin                      &&
  install  doc/ping.8  /usr/man/man8/ping.8           &&
  install  doc/ping.8  /usr/man/man8/ping6.8

) > $C_FIFO 2>&1
