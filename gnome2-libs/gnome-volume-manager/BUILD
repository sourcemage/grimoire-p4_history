OPTS=$(echo $OPTS|sed 's!PMOUNT_ON!--with-hal-mount=\"/usr/bin/pmount-hal %h\" --with-hal-umount=\"/usr/bin/pumount %d\"!')

make_single    &&
eval "./configure --prefix=${INSTALL_ROOT}/usr  \
              --sysconfdir=${INSTALL_ROOT}/etc  \
           --localstatedir=${INSTALL_ROOT}/var  \
                  --mandir=${INSTALL_ROOT}/usr/share/man   \
                 --infodir=${INSTALL_ROOT}/usr/share/info  \
                       $OPTS"                 &&
make					      &&	
make_normal
