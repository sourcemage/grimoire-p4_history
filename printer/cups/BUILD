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


  # Remove all possible regular files which may have been previously installed
  if  [  -f  /etc/rc0.d/K*cups  ];
  then
    rm  /etc/rc0.d/K*cups
  fi

  if  [  -f  /etc/rc2.d/S*cups  ];
  then
    rm  /etc/rc2.d/S*cups
  fi

  if  [  -f  /etc/rc3.d/S*cups  ];
  then
    rm  /etc/rc3.d/S*cups
  fi

  if  [  -f  /etc/rc5.d/S*cups  ];
  then
    rm  /etc/rc5.d/S*cups
  fi


  # Install the symlinks for the requested runlevels
  case  $START_CUPS_0  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc0.d/S*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc0.d/S99cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc0.d/S*cups  ];
      then
        rm  /etc/rc0.d/S*cups
      fi
      ;;
  esac

  case  $START_CUPS_1  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc1.d/S*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc1.d/S99cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc1.d/S*cups  ];
      then
        rm  /etc/rc1.d/S*cups
      fi
      ;;
  esac

  case  $START_CUPS_2  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc2.d/S*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc2.d/S99cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc2.d/S*cups  ];
      then
        rm  /etc/rc2.d/S*cups
      fi
      ;;
  esac

  case  $START_CUPS_3  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc3.d/S*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc3.d/S99cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc3.d/S*cups  ];
      then
        rm  /etc/rc3.d/S*cups
      fi
      ;;
  esac

  case  $START_CUPS_4  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc4.d/S*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc4.d/S99cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc4.d/S*cups  ];
      then
        rm  /etc/rc4.d/S*cups
      fi
      ;;
  esac

  case  $START_CUPS_5  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc5.d/S*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc5.d/S99cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc5.d/S*cups  ];
      then
        rm  /etc/rc5.d/S*cups
      fi
      ;;
  esac

  case  $START_CUPS_6  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc6.d/S*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc6.d/S99cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc6.d/S*cups  ];
      then
        rm  /etc/rc6.d/S*cups
      fi
      ;;
  esac


  # Install the symlinks for the requested runlevels
  case  $END_CUPS_0  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc0.d/K*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc0.d/K00cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc0.d/K*cups  ];
      then
        rm  /etc/rc0.d/K*cups
      fi
      ;;
  esac

  case  $END_CUPS_1  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc1.d/K*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc1.d/K00cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc1.d/K*cups  ];
      then
        rm  /etc/rc1.d/K*cups
      fi
      ;;
  esac

  case  $END_CUPS_2  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc2.d/K*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc2.d/K00cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc2.d/K*cups  ];
      then
        rm  /etc/rc2.d/K*cups
      fi
      ;;
  esac

  case  $END_CUPS_3  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc3.d/K*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc3.d/K00cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc3.d/K*cups  ];
      then
        rm  /etc/rc3.d/K*cups
      fi
      ;;
  esac

  case  $END_CUPS_4  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc4.d/K*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc4.d/K00cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc4.d/K*cups  ];
      then
        rm  /etc/rc4.d/K*cups
      fi
      ;;
  esac

  case  $END_CUPS_5  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc5.d/K*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc5.d/K00cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc5.d/K*cups  ];
      then
        rm  /etc/rc5.d/K*cups
      fi
      ;;
  esac

  case  $END_CUPS_6  in
    y|Y|j|J)
      if  !  [  -L  /etc/rc6.d/K*cups  ];
      then
        ln  -s  /etc/init.d/cups  /etc/rc6.d/K00cups
      fi
      ;;
    *)
      if  [  -L  /etc/rc6.d/K*cups  ];
      then
        rm  /etc/rc6.d/K*cups
      fi
      ;;
  esac


  if  [  "`gaze  installed  |  grep  samba  |  cut  -d:  -f1`"  =  "samba"  ];
  then
    if  !  [  -L  /usr/lib/cups/backend/smb  ];
    then
      ln  -s  /usr/bin/smbspool  /usr/lib/cups/backend/smb
    fi
  fi

) > $C_FIFO 2>&1
