sedit  's:net/bpf.h:pcap-bpf.h:'  pppd/demand.c     &&
sedit  's:net/bpf.h:pcap-bpf.h:'  pppd/sys-linux.c  &&

default_build  &&
(

  mkdir  -p  /etc/ppp/peers
  mkdir  -p  /etc/ppp/chat

  ln  -f  /etc/ppp/resolv.conf /etc/resolv.conf

  cp  $SCRIPT_DIRECTORY/pon   /usr/bin
  cp  $SCRIPT_DIRECTORY/poff  /usr/bin

  if  !  [  -f                     /etc/ppp/options  ];  then
    cp  $SCRIPT_DIRECTORY/options  /etc/ppp/options
  fi

  if  [  !  -e                       /etc/ppp/peers/isp  ];  then
    cp  $SCRIPT_DIRECTORY/peers      /etc/ppp/peers/isp
  fi

  if  [  !  -e                 /etc/ppp/chat/isp  ];  then
    cp  $SCRIPT_DIRECTORY/isp  /etc/ppp/chat/isp
  fi


  cat  $SCRIPT_DIRECTORY/message

  chown  root:ppp     /usr/sbin/pppd
  chmod  4750         /usr/sbin/pppd
  chown  -R root:ppp  /etc/ppp
  chmod  600          /etc/ppp/*-secrets

)
