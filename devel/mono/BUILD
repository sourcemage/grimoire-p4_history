(
  ./configure  --build=$BUILD        				\
	         --prefix=${INSTALL_ROOT}/usr         		\
                 --sysconfdir=${INSTALL_ROOT}/etc     		\
                 --localstatedir=${INSTALL_ROOT}/var  		\
	 	 --with-gc=boehm                                \
                 $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make install

)  >  ${C_FIFO}  2>&1
