(
if [[ $(gcc -dumpversion)   == 3.3* ]] ; then
patch -p1 < $SCRIPT_DIRECTORY/libggi-gcc3.3.patch
fi
  ./configure  --build=$BUILD        				\
	         --prefix=${INSTALL_ROOT}/usr         		\
                 --sysconfdir=${INSTALL_ROOT}/etc     		\
                 --localstatedir=${INSTALL_ROOT}/var  		\
                 $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make install

)  >  ${C_FIFO}  2>&1
