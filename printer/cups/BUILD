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


  source  $SCRIPT_DIRECTORY/lib_runlevel
  installscript  cups.sh

) > $C_FIFO 2>&1
