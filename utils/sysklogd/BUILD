(

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

  cp  $SCRIPT_DIRECTORY/sysklogd.sh  /etc/init.d
  ln      -sf ../init.d/sysklogd.sh  /etc/rcS.d/S20sysklogd
  ln      -sf ../init.d/sysklogd.sh  /etc/rc0.d/K70sysklogd
  ln      -sf ../init.d/sysklogd.sh  /etc/rc6.d/K70sysklogd

)
