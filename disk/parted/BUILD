(
  patch -p0 < $SCRIPT_DIRECTORY/parted165gcc3.3.patch		&&
  ./configure  --build=$BUILD        				\
	         --prefix=${INSTALL_ROOT}/usr         		\
                 --sysconfdir=${INSTALL_ROOT}/etc     		\
                 --localstatedir=${INSTALL_ROOT}/var  		\
                 $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make install

)  >  ${C_FIFO}  2>&1
