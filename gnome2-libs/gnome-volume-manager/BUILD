if [ "$GVM_PMOUNT" == "y" ]; then
   OPTS="$OPTS --with-mount-command=\"/usr/bin/pmount-hal %h\" --with-unmount-command=\"/usr/bin/pumount %d\""
fi  &&

make_single    &&
eval "./configure --prefix=${INSTALL_ROOT}/usr  \
              --sysconfdir=${INSTALL_ROOT}/etc  \
           --localstatedir=${INSTALL_ROOT}/var  \
                  --mandir=${INSTALL_ROOT}/usr/share/man   \
                 --infodir=${INSTALL_ROOT}/usr/share/info  \
                       $OPTS"                 &&
make					      &&	
make_normal
