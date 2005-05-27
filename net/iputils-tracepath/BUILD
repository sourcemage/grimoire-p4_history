(

  unpack  $SOURCE2  ${MD5[1]}                             &&
  gunzip  -c  $SOURCE_CACHE/$SOURCE2  |  patch  -p1       &&

  # Removes some silly errors.
  sedit  '20,26 d'  include-glibc/netinet/in.h            &&

  make  TARGETS="tracepath tracepath6 traceroute6"        &&
  prepare_install                                         &&
  install  tracepath  tracepath6  traceroute6  /usr/bin   &&
  install  doc/tracepath.8  /usr/man/man8/tracepath.8     &&
  install  doc/tracepath.8  /usr/man/man8/tracepath6.8    &&
  install  doc/traceroute6.8  /usr/man/man8/traceroute6.8

) > $C_FIFO 2>&1
