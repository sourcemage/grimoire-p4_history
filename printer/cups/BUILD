fake_redhat()  {

  if  !  [  -d  /etc/rc.d  ]   ||
      !  [  -h  /etc/rc.d  ];  then
      ln  -s  . /etc/rc.d
  fi

}


(

  if  echo  $OPTS  |  grep  -q  SAMBA
  then
    SMB_BACKEND=y
    OPTS=echo  $OPTS  |  sed  "s:SAMBA::"
  else
    SMB_BACKEND=n
  fi

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
  make    install

  if  [  "$SMB_BACKEND"  ==  "y"  ]
  then
    ln  -sf  /usr/bin/smbspool  /usr/lib/cups/backend/smb
  fi

) > $C_FIFO 2>&1
