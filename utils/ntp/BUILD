config_initd ()
{

  cp  $SCRIPT_DIRECTORY/ntpd.sh     /etc/init.d/

  case  $INTPD_BOOT  in
    y|Y|j|J)
      ln  -nsf  ../init.d/ntpd.sh  /etc/rc0.d/K10ntpd
      ln  -nsf  ../init.d/ntpd.sh  /etc/rc1.d/K10ntpd
      ln  -nsf  ../init.d/ntpd.sh  /etc/rc2.d/K10ntpd
      ln  -nsf  ../init.d/ntpd.sh  /etc/rc6.d/K10ntpd

      ln  -nsf  ../init.d/ntpd.sh  /etc/rc3.d/S90ntpd
      ln  -nsf  ../init.d/ntpd.sh  /etc/rc4.d/S90ntpd
      ln  -nsf  ../init.d/ntpd.sh  /etc/rc5.d/S90ntpd
      ;;
    *)  true
      ;;
  esac

}

config_xinetd ()
{

  cp  $SCRIPT_DIRECTORY/ntp  /etc/xinetd.d/

}

(

  ./configure                  \
    --build=$BUILD             \
    --prefix=/usr              \
    --sysconfdir=/etc          \
    --localstatedir=/var/cache \
    --libexecdir=/usr/bin      \
    $OPTS                      &&
  make                         &&
  prepare_install              &&
  make    install              &&

  if  [  $INTPD_BOOT = "y"  ];  then
    config_initd
  fi

  if  [  $XNTPD_BOOT = "y"  ];  then
    config_xinetd
  fi

) > $C_FIFO 2>&1
