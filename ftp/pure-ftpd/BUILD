(

  if  spell_installed  Linux-PAM;  then
    WITH_PAM="--with-pam"
  fi


  ./configure  --sysconfdir=/etc  \
               --prefix=/usr      \
               --with-largefile   \
               --with-everything  \
               $WITH_PAM          \
               $OPTS              &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1  &&  (


  if    [  !  -f  /etc/ftplockout  ]
  then  cp  pam/ftplockout  /etc
  fi

  case  $FTPD_BOOT  in
    y|Y|j|J)  cp  $SCRIPT_DIRECTORY/pure-ftpd.sh  /etc/init.d

              ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc0.d/K10pure-ftpd
              ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc1.d/K10pure-ftpd
              ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc2.d/K10pure-ftpd
              ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc6.d/K10pure-ftpd

              ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc3.d/S90pure-ftpd
              ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc4.d/S90pure-ftpd
              ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc5.d/S90pure-ftpd
              ;;
          *)  true  ;;
  esac

)
