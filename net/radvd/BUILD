(

  ./configure --with-configfile=${INSTALL_ROOT}/etc/radvd.conf	&& 
  make                                                          &&
  prepare_install                                               &&
  make prefix=${INSTALL_ROOT}/usr install

) > $C_FIFO 2>&1 && (

  cp $SOURCE_DIRECTORY/radvd.conf.example ${INSTALL_ROOT}/etc/radvd.conf

)
