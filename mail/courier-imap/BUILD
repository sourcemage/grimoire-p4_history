(
  case  $IPV6  in
    n|N)  OPTS="$OPTS  --without-ipv6"  ;;
  esac

  ./configure   --prefix=/usr                     \
                --localstatedir=/var/lib/${SPELL} \
                --sysconfdir=/etc/${SPELL}        \
                --disable-root-check              \
               $OPTS                  &&

  make                                &&
  prepare_install                     &&
  make    install                     &&
  make    install-configure           &&
  mkimapdcert                         &&

  if spell_installed Linux-PAM
    then cp $SCRIPT_DIRECTORY/pam.d/* /etc/pam.d
  fi
) > $C_FIFO 2>&1 && (
 
 chmod 555 *.rc

 case  $IMAP_BOOT  in
    y|Y|j|J)  cp  imapd.rc  /etc/init.d/imapd.sh

              ln  -sf  ../init.d/imapd.sh  /etc/rc0.d/K10imapd
              ln  -sf  ../init.d/imapd.sh  /etc/rc1.d/K10imapd
              ln  -sf  ../init.d/imapd.sh  /etc/rc2.d/K10imapd
              ln  -sf  ../init.d/imapd.sh  /etc/rc6.d/K10imapd

              ln  -sf  ../init.d/imapd.sh  /etc/rc3.d/S90imapd
              ln  -sf  ../init.d/imapd.sh  /etc/rc4.d/S90imapd
              ln  -sf  ../init.d/imapd.sh  /etc/rc5.d/S90imapd
              ;;
          *)  true  ;;
  esac
) && (

 case  $IMAPS_BOOT  in
    y|Y|j|J)  cp  imapd-ssl.rc  /etc/init.d/imapd-ssl.sh

              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc0.d/K10imapd-ssl
              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc1.d/K10imapd-ssl
              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc2.d/K10imapd-ssl
              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc6.d/K10imapd-ssl

              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc3.d/S90imapd-ssl
              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc4.d/S90imapd-ssl
              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc5.d/S90imapd-ssl
              ;;
          *)  true  ;;
  esac
) && (

 case  $POP3_BOOT  in
    y|Y|j|J)  cp  pop3d.rc  /etc/init.d/pop3d.sh

              ln  -sf  ../init.d/pop3d.sh  /etc/rc0.d/K10pop3d
              ln  -sf  ../init.d/pop3d.sh  /etc/rc1.d/K10pop3d
              ln  -sf  ../init.d/pop3d.sh  /etc/rc2.d/K10pop3d
              ln  -sf  ../init.d/pop3d.sh  /etc/rc6.d/K10pop3d

              ln  -sf  ../init.d/pop3d.sh  /etc/rc3.d/S90pop3d
              ln  -sf  ../init.d/pop3d.sh  /etc/rc4.d/S90pop3d
              ln  -sf  ../init.d/pop3d.sh  /etc/rc5.d/S90pop3d
              ;;
          *)  true  ;;
  esac
) && (

 case  $POP3S_BOOT  in
    y|Y|j|J)  cp  pop3d-ssl.rc  /etc/init.d/pop3d-ssl.sh

              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc0.d/K10pop3d-ssl
              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc1.d/K10pop3d-ssl
              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc2.d/K10pop3d-ssl
              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc6.d/K10pop3d-ssl

              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc3.d/S90pop3d-ssl
              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc4.d/S90pop3d-ssl
              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc5.d/S90pop3d-ssl
              ;;
          *)  true  ;;
  esac
)
