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

) > $C_FIFO 2>&1
