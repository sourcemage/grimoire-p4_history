(

  if  spell_installed  Linux-PAM;  then
    WITH_PAM="--with-pam"
  fi

  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $WITH_PAM             \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  mkdir  -p  /etc/netatalk           &&
  make    install

  cp $SCRIPT_DIRECTORY/netatalk.sh /etc/init.d
  ln -sf ../init.d/netatalk.sh /etc/rc3.d/S80netatalk
  ln -sf ../init.d/netatalk.sh /etc/rc4.d/S80netatalk
  ln -sf ../init.d/netatalk.sh /etc/rc5.d/S80netatalk
) > $C_FIFO 2>&1
