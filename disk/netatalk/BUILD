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

) > $C_FIFO 2>&1
