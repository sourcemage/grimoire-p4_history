(

  if  spell_installed  Linux-PAM;  then
    ENABLE_PAM="--enable-pam"
  fi

  sedit  "s/	standalone/	inetd/"    \
         sample-configurations/basic.conf  &&
  ./configure  --prefix=/usr               \
               --sysconfdir=/etc           \
               --localstatedir=/var/run    \
               --enable-shadow             \
               $ENABLE_PAM                 \
               $OPTS                       &&
  make                                     &&
  prepare_install                          &&
  make    install                          &&
  cp  -r  sample-configurations  doc

  cp  $SCRIPT_DIRECTORY/proftpd.sh  /etc/init.d

  case  $APACHE_BOOT  in
      y|Y|j|J)
            sedit  "s/   inetd/ standalone/"    \
                     /etc/proftpd.conf
            ln  -sf  ../init.d/proftpd.sh  /etc/rc0.d/K10proftpd
            ln  -sf  ../init.d/proftpd.sh  /etc/rc1.d/K10proftpd
            ln  -sf  ../init.d/proftpd.sh  /etc/rc2.d/K10proftpd
            ln  -sf  ../init.d/proftpd.sh  /etc/rc6.d/K10proftpd

            ln  -sf  ../init.d/proftpd.sh  /etc/rc3.d/S90proftpd
            ln  -sf  ../init.d/proftpd.sh  /etc/rc4.d/S90proftpd
            ln  -sf  ../init.d/proftpd.sh  /etc/rc5.d/S90proftpd
        ;;
        *)  true  ;;
   esac
                                                                  

) > $C_FIFO 2>&1
