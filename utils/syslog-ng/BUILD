sedit  "s/-O2/$CFLAGS/"  configure
default_build  &&

(

  if  [  !     -f                      /etc/syslog-ng/syslog-ng.conf  ];
  then  mkdir  -p                      /etc/syslog-ng
        cp  doc/syslog-ng.conf.sample  /etc/syslog-ng/syslog-ng.conf
  fi

  cp  $SCRIPT_DIRECTORY/syslog-ng.sh  /etc/init.d
  ln      -sf ../init.d/syslog-ng.sh  /etc/rcS.d/S20syslog-ng
  ln      -sf ../init.d/syslog-ng.sh  /etc/rc0.d/K70syslog-ng
  ln      -sf ../init.d/syslog-ng.sh  /etc/rc6.d/K70syslog-ng

)
