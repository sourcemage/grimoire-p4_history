fake_redhat()  {

  if  !  [  -d  /etc/rc.d  ]   ||
      !  [  -h  /etc/rc.d  ];  then
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


  if  [  !  -e  /usr/share/cups/model/cupsomatic  ];  then
    tar  xyf  $SCRIPT_DIRECTORY/cupsomatic.tar.bz2  -C  /usr/share/cups/model/
  fi


  # Remove all possible regular files which may have been previously installed
  if  [  -f  /etc/rc0.d/K*cups  ];  then
    rm  /etc/rc0.d/K*cups
  fi

  if  [  -f  /etc/rc2.d/S*cups  ];  then
    rm  /etc/rc2.d/S*cups
  fi

  if  [  -f  /etc/rc3.d/S*cups  ];  then
    rm  /etc/rc3.d/S*cups
  fi

  if  [  -f  /etc/rc5.d/S*cups  ];  then
    rm  /etc/rc5.d/S*cups
  fi


  # Ask which runlevels to start in with a default of 1,2,3,5
  echo  ""
  echo  "We now want to determine which runlevels you want CUPS started in."
  echo  "The defaults are 1, 2, 3 and 5."

  if  query  "Start CUPS in runlevl 0? "  n;  then
    if  !  [  -L  /etc/rc0.d/S*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc0.d/S99cups
    fi
  else  
    if  [  -L  /etc/rc0.d/S*cups  ];  then
      rm  /etc/rc0.d/S*cups
    fi
  fi

  if  query  "Start CUPS in runlevl 1? "  y;  then
    if  !  [  -L  /etc/rc1.d/S*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc1.d/S99cups
    fi
  else  
    if  [  -L  /etc/rc1.d/S*cups  ];  then
      rm  /etc/rc1.d/S*cups
    fi
  fi

  if  query  "Start CUPS in runlevl 2? "  y;  then
    if  !  [  -L  /etc/rc2.d/S*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc2.d/S99cups
    fi
  else  
    if  [  -L  /etc/rc2.d/S*cups  ];  then
      rm  /etc/rc2.d/S*cups
    fi
  fi

  if  query  "Start CUPS in runlevl 3? "  y;  then
    if  !  [  -L  /etc/rc3.d/S*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc3.d/S99cups
    fi
  else  
    if  [  -L  /etc/rc3.d/S*cups  ];  then
      rm  /etc/rc3.d/S*cups
    fi
  fi

  if  query  "Start CUPS in runlevl 4? "  n;  then
    if  !  [  -L  /etc/rc4.d/S*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc4.d/S99cups
    fi
  else  
    if  [  -L  /etc/rc4.d/S*cups  ];  then
      rm  /etc/rc4.d/S*cups
    fi
  fi

  if  query  "Start CUPS in runlevl 5? "  y;  then
    if  !  [  -L  /etc/rc5.d/S*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc5.d/S99cups
    fi
  else  
    if  [  -L  /etc/rc5.d/S*cups  ];  then
      rm  /etc/rc5.d/S*cups
    fi
  fi

  if  query  "Start CUPS in runlevl 6? "  n;  then
    if  !  [  -L  /etc/rc6.d/S*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc6.d/S99cups
    fi
  else  
    if  [  -L  /etc/rc6.d/S*cups  ];  then
      rm  /etc/rc6.d/S*cups
    fi
  fi


  # Ask which runlevels to stop on with a default of 0,6.
  echo  ""
  echo  "We now want to determine which runlevels you want CUPS to end in."
  echo  "The defaults are 0 and 6."

  if  query  "End CUPS in runlevl 0? "  y;  then
    if  !  [  -L  /etc/rc0.d/K*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc0.d/K00cups
    fi
  else  
    if  [  -L  /etc/rc0.d/K*cups  ];  then
      rm  /etc/rc0.d/K*cups
    fi
  fi

  if  query  "End CUPS in runlevl 1? "  n;  then
    if  !  [  -L  /etc/rc1.d/K*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc1.d/K00cups
    fi
  else  
    if  [  -L  /etc/rc1.d/K*cups  ];  then
      rm  /etc/rc1.d/K*cups
    fi
  fi

  if  query  "End CUPS in runlevl 2? "  n;  then
    if  !  [  -L  /etc/rc2.d/K*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc2.d/K00cups
    fi
  else  
    if  [  -L  /etc/rc2.d/K*cups  ];  then
      rm  /etc/rc2.d/K*cups
    fi
  fi

  if  query  "End CUPS in runlevl 3? "  n;  then
    if  !  [  -L  /etc/rc3.d/K*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc3.d/K00cups
    fi
  else  
    if  [  -L  /etc/rc3.d/K*cups  ];  then
      rm  /etc/rc3.d/K*cups
    fi
  fi

  if  query  "End CUPS in runlevl 4? "  n;  then
    if  !  [  -L  /etc/rc4.d/K*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc4.d/K00cups
    fi
  else  
    if  [  -L  /etc/rc4.d/K*cups  ];  then
      rm  /etc/rc4.d/K*cups
    fi
  fi

  if  query  "End CUPS in runlevl 5? "  n;  then
    if  !  [  -L  /etc/rc5.d/K*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc5.d/K00cups
    fi
  else  
    if  [  -L  /etc/rc5.d/K*cups  ];  then
      rm  /etc/rc5.d/K*cups
    fi
  fi

  if  query  "End CUPS in runlevl 6? "  y;  then
    if  !  [  -L  /etc/rc6.d/K*cups  ];  then
      ln  -s  /etc/init.d/cups  /etc/rc6.d/K00cups
    fi
  else  
    if  [  -L  /etc/rc6.d/K*cups  ];  then
      rm  /etc/rc6.d/K*cups
    fi
  fi


  if  [  "`gaze  installed  |  grep  samba  |  cut  -d:  -f1`"  =  "samba"  ];  then
    if  !  [  -L  /usr/lib/cups/backend/smb  ];  then
      ln  -s  /usr/bin/smbspool  /usr/lib/cups/backend/smb
    fi
  fi

) > $C_FIFO 2>&1
