( 
#If these switches are used, they stop distcc and ccache from working
#  We could write wrappers for all of the possible binaries
[[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"
  
  ./configure --prefix=${INSTALL_ROOT}/usr  \
         --exec-prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                &&
  make                                      &&
  prepare_install                           &&
  OLD_LD_PRELOAD="$LD_PRELOAD"              &&
  unset LD_PRELOAD                          &&
  LD_PRELOAD="$OLD_LD_PRELOAD"              &&
  make    install                            

) > $C_FIFO 2>&1

