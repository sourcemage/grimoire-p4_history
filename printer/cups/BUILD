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


  if  [  !  -e  /usr/lib/cups/filter/cupsomatic  ];  then
    cp  /var/spool/sorcery/cupsomatic  /usr/lib/cups/filter/
  fi

  chmod  755  /usr/lib/cups/filter/cupsomatic

  if  [  "`gaze  installed  |  grep  samba  |  cut  -d:  -f1`"  =  "samba"  ];  then
    if  !  [  -L  /usr/lib/cups/backend/smb  ];  then
      ln  -s  /usr/bin/smbspool  /usr/lib/cups/backend/smb
    fi
  fi

) > $C_FIFO 2>&1
