(
if [ -f /usr/include/linux/fusion.h ]
then OPTS="$OPTS --enable-multi"
fi                                                              &&
export CPPFLAGS="$CPPFLAGS -I/usr/include/libmpeg3/"            &&
  ./configure  --build=$BUILD        				\
	         --prefix=${INSTALL_ROOT}/usr         		\
                 --sysconfdir=${INSTALL_ROOT}/etc     		\
                 --localstatedir=${INSTALL_ROOT}/var  		\
                 --enable-linux-input                           \
                 $OPTS                                          &&
  make                                                          &&
 cd DirectFB-extra-0.9.16                                         &&
  ./configure  --build=$BUILD        				\
	         --prefix=${INSTALL_ROOT}/usr         		\
                 --sysconfdir=${INSTALL_ROOT}/etc     		\
                 --localstatedir=${INSTALL_ROOT}/var  		\
                 --enable-avifile=no                            \
                 $OPTS                                          &&
  make                                                          &&
 cd $SOURCE_DIRECTORY                                           &&
  prepare_install                                               &&
  make install                                                  &&
 cd DirectFB-extra-0.9.16                                       &&
  make install                                                  &&
  ###something changed so libggi needs these symlinks.
  ln -sf ${INSTALL_ROOT}/usr/include/directfb/* ${INSTALL_ROOT}/usr/include/directfb-internal/ 
)  >  ${C_FIFO}  2>&1
