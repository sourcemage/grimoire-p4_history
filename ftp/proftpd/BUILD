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
  sedit  's:RUN_DIR.*"/var/run/proftpd":RUN_DIR "/var/run":' \
         config.h                          &&
  sedit  's:rundir=/var/run/proftpd:rundir=/var/run:'  Make.rules  &&
  make                                     &&
  prepare_install                          &&
  make    install                          &&
  cp  -r  sample-configurations  doc

) > $C_FIFO 2>&1
