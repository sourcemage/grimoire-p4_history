fake_redhat()  {

  if  !  [  -d  /etc/rc.d  ]   ||
      !  [  -h  /etc/rc.d  ];  then
      ln  -s  . /etc/rc.d
  fi

}


(

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

) > $C_FIFO 2>&1
