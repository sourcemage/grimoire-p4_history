(

  patch  -p1  <  $SCRIPT_DIRECTORY/sysklogd-1.4.1-kernel_header.patch  &&

  sedit  "s:BINDIR = /usr/sbin:BINDIR=/sbin:"  Makefile  &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1  &&  (

  if  !  [  -e  /etc/syslog.conf  ];  then
    sedit  "s/usr/var/"		syslog.conf
    sedit  "s/adm/log/"		syslog.conf
    sedit  "s/,joey//"		syslog.conf
    sedit  "s/^.*finlandia$//"	syslog.conf
    cp                   syslog.conf  /etc
  fi

)
