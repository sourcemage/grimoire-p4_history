(

  for i in $(grep -rl CONFIG_PHONE .)
  do
    sedit  "s/CONFIG_PHONE/NTP_CONFIG_PHONE/g"  $i
  done                                        &&

  ./configure                                 \
    --build=$BUILD                            \
    --prefix=${INSTALL_ROOT}/usr              \
    --sysconfdir=${INSTALL_ROOT}/etc          \
    --localstatedir=${INSTALL_ROOT}/var/cache \
    --libexecdir=${INSTALL_ROOT}/usr/bin      \
    $OPTS                                     &&
  make                                        &&
  prepare_install                             &&
  make    install              

) > $C_FIFO 2>&1
