default_build  &&

(

  cp  -f  /usr/libexec/slapd  /usr/sbin/

  case  $SLAPD_BOOT  in
    y|Y|j|J)  cp  $SCRIPT_DIRECTORY/slapd.sh  /etc/init.d/

              ln  -sf  ../init.d/slapd.sh  /etc/rc0.d/K50slapd
              ln  -sf  ../init.d/slapd.sh  /etc/rc6.d/K50slapd

              ln  -sf  ../init.d/slapd.sh  /etc/rc1.d/S35slapd
              ln  -sf  ../init.d/slapd.sh  /etc/rc2.d/S35slapd
              ln  -sf  ../init.d/slapd.sh  /etc/rc3.d/S35slapd
              ln  -sf  ../init.d/slapd.sh  /etc/rc4.d/S35slapd
              ln  -sf  ../init.d/slapd.sh  /etc/rc5.d/S35slapd
              ;;
          *)  ;;
  esac
  
)
