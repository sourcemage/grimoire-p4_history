(
  prepare_install                                      &&
  cp  ddclient  /usr/sbin                              &&
  if  [  !  -f  /etc/ddclient.conf  ]  ;  then
    cp  sample-etc_ddclient.conf /etc/ddclient.conf
  fi  &&
  mkdir  -p  /usr/doc/ddclient                         &&
  cp  sample-*  /usr/doc/ddclient                      &&
  cp  README  /usr/doc/ddclient

) > $C_FIFO 2>&1
