fake_redhat()  {

  if  !  [  -d  ${INSTALL_ROOT}/etc/rc.d  ]   &&
      !  [  -h  ${INSTALL_ROOT}/etc/rc.d  ];
  then
      ln  -s  . ${INSTALL_ROOT}/etc/rc.d
  fi

}


(

  patch  -p0  <  $SCRIPT_DIRECTORY/Makefile.diff

  ./configure  --bindir=${INSTALL_ROOT}/usr/bin     \
               --sbindir=${INSTALL_ROOT}/usr/sbin   \
               --datadir=${INSTALL_ROOT}/usr/share  \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               --libdir=${INSTALL_ROOT}/usr/lib     \
               --mandir=${INSTALL_ROOT}/usr/man     \
               $OPTS                                &&
  make                                              &&
  prepare_install                                   &&
  fake_redhat                                       &&
  make    install                                   &&


  if  [  "`gaze  installed  |  grep  samba  |  cut  -d:  -f1`"  =  "samba"  ];  then
    if  !  [  -L  ${INSTALL_ROOT}/usr/lib/cups/backend/smb  ];  then
      ln  -s  ${INSTALL_ROOT}/usr/bin/smbspool  ${INSTALL_ROOT}/usr/lib/cups/backend/smb
    fi
  fi

) > $C_FIFO 2>&1
