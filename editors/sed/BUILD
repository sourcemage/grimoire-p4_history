(
  ./configure  --build=$BUILD                           \
                 --prefix=${INSTALL_ROOT}/usr           \
                 --sysconfdir=${INSTALL_ROOT}/etc       \
                 --localstatedir=${INSTALL_ROOT}/var    \
                 --bindir=${INSTALL_ROOT}/bin           \
                 --infodir=${INSTALL_ROOT}/usr/share/info \
                 --mandir=${INSTALL_ROOT}/usr/share/man   \
                 $OPTS                                  &&
  make                                                  &&
  ### /bin/sed is "protected" but it is from an "old" install
  ### just incase it has been removed I copy it first 
  ### so the cast will complete.
  if  [ -f ${INSTALL_ROOT}/usr/bin/sed ] ; then
  cp -a ${INSTALL_ROOT}/usr/bin/sed /bin/sed
  fi                                                    &&
  prepare_install                                       &&
  make install

)  >  ${C_FIFO}  2>&1
