(
  sedit  "s/	standalone/	inetd/"    \
         sample-configurations/basic.conf  &&
  ./configure  --prefix=${INSTALL_ROOT}/usr               \
               --sysconfdir=${INSTALL_ROOT}/etc           \
               --localstatedir=${INSTALL_ROOT}/var/run    \
               --enable-shadow             \
               $OPTS                       &&
  sedit  's:RUN_DIR.*"/var/run/proftpd":RUN_DIR "/var/run":' \
         config.h                          &&
  sedit  's:rundir=/var/run/proftpd:rundir=/var/run:'  Make.rules  &&
  make                                     &&
  prepare_install                          &&
  make    install                          &&
  cp  -r  sample-configurations  doc

) > $C_FIFO 2>&1
