(

  create_account sshd

  ./configure  --prefix=/usr            \
               --sysconfdir=/etc/ssh    \
               --with-md5-passwords     \
               --mandir=/usr/share/man  \
               $OPTS                    &&
  make                                  &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1

(

  case $SSHD_BOOT  in
    y|Y|j|J)  cp  $SCRIPT_DIRECTORY/sshd.sh  /etc/init.d

              ln  -sf  ../init.d/sshd.sh  /etc/rc0.d/K50sshd
              ln  -sf  ../init.d/sshd.sh  /etc/rc6.d/K50sshd

              ln  -sf  ../init.d/sshd.sh  /etc/rc1.d/S35sshd
              ln  -sf  ../init.d/sshd.sh  /etc/rc2.d/S35sshd
              ln  -sf  ../init.d/sshd.sh  /etc/rc3.d/S35sshd
              ln  -sf  ../init.d/sshd.sh  /etc/rc4.d/S35sshd
              ln  -sf  ../init.d/sshd.sh  /etc/rc5.d/S35sshd
              ;;
          *)  ;;
  esac

)

