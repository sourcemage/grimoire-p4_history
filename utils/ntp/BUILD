(

  groupadd  ntp           2>/dev/null
  useradd   ntp  -g  ntp  2>/dev/null
  mkdir -p ${INSTALL_ROOT}/var/chroot/ntp/

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
    --enable-linuxcaps                        \
    $OPTS                                     &&
  make                                        &&
  prepare_install                             &&
  make    install              

) > $C_FIFO 2>&1
