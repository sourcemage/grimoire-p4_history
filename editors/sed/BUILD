(
  ./configure  --build=$BUILD                           \
                 --prefix=${INSTALL_ROOT}/usr           \
                 --sysconfdir=${INSTALL_ROOT}/etc       \
                 --localstatedir=${INSTALL_ROOT}/var    \
                 --bindir=${INSTALL_ROOT}/bin           \
                 $OPTS                                  &&
  make                                                  &&
  ### /bin/sed is "protected" but it is from an "old" install
  ### just incase it has been removed I copy it first 
  ### so the cast will complete.
  cp ${INSTALL_ROOT}/usr/bin/sed /bin/sed               &&
  prepare_install                                       &&
  make install

)  >  ${C_FIFO}  2>&1
