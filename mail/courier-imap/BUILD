(

  case  $IPV6  in
    n|N)  IPV6="--without-ipv6"   ;;
    *)    message "${MESSAGE_COLOR}Using IPV6... ${DEFAULT_COLOR}"	&&
	  IPV6="--with-ipv6" 	  ;;
  esac									&&

  case  $PAM   in
    n|N)  PAM="--without-authpam" ;;
    *)    message "${MESSAGE_COLOR}Using PAM... ${DEFAULT_COLOR}"	&&
          unset PAM               ;;
  esac									&&

  ./configure $IPV6 $PAM --prefix=/usr     --localstatedir=/var     	\
                         --sysconfdir=/etc/$SPELL --disable-root-check 	\
                         --enable-workarounds-for-imap-client-bugs 	\
                         --datadir=/usr/share/$SPELL                    \
                         --libexecdir=/usr/libexec/$SPELL               &&

  make                                					&&

  prepare_install                     					&&

  mkdir -p /usr/share/$SPELL						&&

  make    install                     					&&
  make    install-configure           					&&

  mkimapdcert                         					&&
  mkpop3dcert								&&

  if ( spell_installed Linux-PAM ) && ( "$PAM" != "" )
  then 
    message "${MESSAGE_COLOR}Setting up /etc/pam.d..."			&&
    cp -v $SCRIPT_DIRECTORY/pam.d/* /etc/pam.d				&&
    message " ${DEFAULT_COLOR}"
  fi									&&

 
  chmod 555 *.rc							&&

  case  $IMAP_BOOT  in
    y|Y|j|J)  cp -v imapd.rc  /etc/init.d/imapd.sh			&&

              ln  -sf  ../init.d/imapd.sh  /etc/rc0.d/K10imapd		&&
              ln  -sf  ../init.d/imapd.sh  /etc/rc1.d/K10imapd		&&
              ln  -sf  ../init.d/imapd.sh  /etc/rc2.d/K10imapd		&&
              ln  -sf  ../init.d/imapd.sh  /etc/rc6.d/K10imapd		&&

              ln  -sf  ../init.d/imapd.sh  /etc/rc3.d/S90imapd		&&
              ln  -sf  ../init.d/imapd.sh  /etc/rc4.d/S90imapd		&&
              ln  -sf  ../init.d/imapd.sh  /etc/rc5.d/S90imapd
              ;;
          *)  true  ;;
   esac									&&

   case  $IMAPS_BOOT  in
    y|Y|j|J)  cp -v imapd-ssl.rc  /etc/init.d/imapd-ssl.sh		&&

              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc0.d/K10imapd-ssl	&&
              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc1.d/K10imapd-ssl	&&
              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc2.d/K10imapd-ssl	&&
              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc6.d/K10imapd-ssl	&&

              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc3.d/S90imapd-ssl	&&
              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc4.d/S90imapd-ssl	&&
              ln  -sf  ../init.d/imapd-ssl.sh  /etc/rc5.d/S90imapd-ssl	
              ;;
          *)  true  ;;
   esac									&&

   case  $POP3_BOOT  in
    y|Y|j|J)  cp -v pop3d.rc  /etc/init.d/pop3d.sh			&&

              ln  -sf  ../init.d/pop3d.sh  /etc/rc0.d/K10pop3d		&&
              ln  -sf  ../init.d/pop3d.sh  /etc/rc1.d/K10pop3d		&&
              ln  -sf  ../init.d/pop3d.sh  /etc/rc2.d/K10pop3d		&&
              ln  -sf  ../init.d/pop3d.sh  /etc/rc6.d/K10pop3d		&&

              ln  -sf  ../init.d/pop3d.sh  /etc/rc3.d/S90pop3d		&&
              ln  -sf  ../init.d/pop3d.sh  /etc/rc4.d/S90pop3d		&&
              ln  -sf  ../init.d/pop3d.sh  /etc/rc5.d/S90pop3d
              ;;
          *)  true  ;;
  esac									&&

  case  $POP3S_BOOT  in
    y|Y|j|J)  cp -v pop3d-ssl.rc  /etc/init.d/pop3d-ssl.sh		&&

              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc0.d/K10pop3d-ssl	&&
              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc1.d/K10pop3d-ssl	&&
              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc2.d/K10pop3d-ssl	&&
              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc6.d/K10pop3d-ssl	&&

              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc3.d/S90pop3d-ssl	&&
              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc4.d/S90pop3d-ssl	&&
              ln  -sf  ../init.d/pop3d-ssl.sh  /etc/rc5.d/S90pop3d-ssl
              ;;
          *)  true  ;;
  esac

) > $C_FIFO 2>&1
