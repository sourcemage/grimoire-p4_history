(
  ./configure                                  \
     --build=$BUILD                            \
     --bindir=${INSTALL_ROOT}/bin              \
     --prefix=${INSTALL_ROOT}/usr              \
     $OPTS                                     &&
  make                                         &&

# We need this directory in the path for the following utilities
# cut, dirname, tail, and uniq
  export PATH="$SOURCE_DIRECTORY/src:$PATH"    && 

  prepare_install                              &&

#horrible hack, some of my best work ;-)
  ./src/ginstall src/ginstall /bin/install     &&

  make    install                              &&
  if [ -f ${INSTALL_ROOT}/usr/bin/install ]
     then rm -rf ${INSTALL_ROOT}/usr/bin/install
  fi                                           &&
  ln -s ${INSTALL_ROOT}/bin/install ${INSTALL_ROOT}/usr/bin/install
#provided by other packages
rm -f ${INSTALL_ROOT}/bin/readlink             &&
rm -f ${INSTALL_ROOT}/bin/uptime               &&
rm -f ${INSTALL_ROOT}/usr/man/man1/uptime.1
) >$C_FIFO 2>&1
