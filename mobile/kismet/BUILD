(
#  if [ "${SYS_PCAP}" = "no" ]
#  then
  cd libpcap-0.7.2  &&
  autoconf          &&
  cd ..             &&
#  fi                                        &&
  ./configure --prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                &&
  make dep                                  &&
  make                                      &&
  prepare_install                           &&
  if [ "$SUID" = "no" ]
  then
    make    install
  else
    make    suidinstall
  fi

) > $C_FIFO 2>&1
