
#  if [ "${SYS_PCAP}" = "no" ]
#  then
cd libpcap-0.8.3  &&
autoconf          &&
cd ..             &&
#  fi                                        &&
./configure --prefix=${INSTALL_ROOT}/usr  \
        --sysconfdir=${INSTALL_ROOT}/etc  \
     --localstatedir=${INSTALL_ROOT}/var  \
                     $OPTS                &&
make dep                                  &&
make                                     

