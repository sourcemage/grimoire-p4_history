(
  ./configure  --build=$BUILD        				\
	         --prefix=${INSTALL_ROOT}/usr         		\
                 --sysconfdir=${INSTALL_ROOT}/etc     		\
                 --localstatedir=${INSTALL_ROOT}/var  		\
                 --with-kerneldir=${INSTALL_ROOT}/usr/src/linux \
                 $OPTS                 				&&
  make             						&&
  prepare_install  						&&
  make install     						&&
  (( i = 1 ))                                                   &&
  for NODE in $NODES; do
    echo "$i	$NODE	1" >> /etc/openmosix.map
    (( i++ ))
  done                                                          &&
  if [ -e /etc/init.d/openmosix ]
  then rm -f /etc/init.d/openmosix
  fi

  
    
) > $C_FIFO 2>&1
