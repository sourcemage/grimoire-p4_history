(
#you have an openmosix kernel so make the link that this package wants
ln -s /usr/src/linux /usr/src/linux-openmosix			&&

  ./configure  --build=$BUILD        				\
	         --prefix=${INSTALL_ROOT}/usr         		\
                 --sysconfdir=${INSTALL_ROOT}/etc     		\
                 --localstatedir=${INSTALL_ROOT}/var  		\
                 $OPTS                 				&&
  make             						&&
  prepare_install  						&&
  make install     						&&

  (( i = 1 ))
  for NODE in $NODES; do
    echo "$i	$NODE	1" >> /etc/openmosix.map
    (( i++ ))
  done
    
) > $C_FIFO 2>&1
