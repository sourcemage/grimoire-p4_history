(

  ./configure  --prefix=${INSTALL_ROOT}/usr        \
           --sysconfdir=${INSTALL_ROOT}/etc/mpich  \
              --disable-f77                        \
               --enable-g77                        \
               ${OPTS}                             &&
  make                                             &&
  prepare_install                                  &&
  make   install
 
) > ${C_FIFO} 2>&1
