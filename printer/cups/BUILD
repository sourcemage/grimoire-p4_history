fake_redhat()  {

  if  !  [  -d  /etc/rc.d  ]   &&
      !  [  -h  /etc/rc.d  ];
  then
      ln  -s  . /etc/rc.d
  fi

}


(

  patch  -p0  <  $SCRIPT_DIRECTORY/Makefile.diff

  ./configure  --bindir=/usr/bin     \
               --sbindir=/usr/sbin   \
               --datadir=/usr/share  \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --libdir=/usr/lib     \
               --mandir=/usr/man     \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  fake_redhat                        &&
  make    install                    &&


  if  [  !  -e  /usr/share/cups/model/cupsomatic  ];
  then
    cp  /var/spool/sorcery/cupsomatic  /usr/share/cups/model/
  fi


  if  [  "`gaze  installed  |  grep  samba  |  cut  -d:  -f1`"  =  "samba"  ];
  then
    if  !  [  -L  /usr/lib/cups/backend/smb  ];
    then
      ln  -s  /usr/bin/smbspool  /usr/lib/cups/backend/smb
    fi
  fi


  if  [  -e  /etc/init.d/functions  ];
  then
    source  $SCRIPT_DIRECTORY/lib_runlevel
    installscript  cups.sh
  else
    install  -m  755  $SCRIPT_DIRECTORY/cups.no-functions.sh  /etc/init.d/cups.sh
    ln  -sf  /etc/init.d/cups.sh  /etc/rc1.d/S99cups
    ln  -sf  /etc/init.d/cups.sh  /etc/rc2.d/S99cups
    ln  -sf  /etc/init.d/cups.sh  /etc/rc3.d/S99cups
    ln  -sf  /etc/init.d/cups.sh  /etc/rc5.d/S99cups
    ln  -sf  /etc/init.d/cups.sh  /etc/rc0.d/K00cups
    ln  -sf  /etc/init.d/cups.sh  /etc/rc6.d/K00cups
  fi

) > $C_FIFO 2>&1
