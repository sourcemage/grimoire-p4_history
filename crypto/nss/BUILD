( 
  export BUILD_OPT=1
  cd security/nss                                    &&
  cp ../coreconf/Linux2.5.mk ../coreconf/Linux2.6.mk &&
  make nss_build_all                                 &&
  ### cheating to get them all in one place
  make install                                       &&
  ### manually do the real install
  prepare_install                                    &&
  sedit "s/usr\/local/usr/g" $SOURCE_DIRECTORY/nsprpub/Linux$(uname -r | cut -c 1-3)_x86_glibc_PTH_OPT.OBJ/config/nspr-config     &&
  cp -v $SOURCE_DIRECTORY/nsprpub/Linux$(uname -r | cut -c 1-3)_x86_glibc_PTH_OPT.OBJ/config/nspr-config ${INSTALL_ROOT}/usr/bin/ && 
  cd $SOURCE_DIRECTORY/dist                          &&
  cp -vaL public/nss ${INSTALL_ROOT}/usr/include/    &&
  cd Linux$(uname -r | cut -c 1-3)_x86_glibc_PTH_OPT.OBJ/lib/                 &&
  cp -vaL *.so ${INSTALL_ROOT}/usr/lib/              &&
  mkdir -p ${INSTALL_ROOT}/usr/include/nspr          &&
  cp -vaL ../include/* ${INSTALL_ROOT}/usr/include/nspr                       &&
  cp -v $SCRIPT_DIRECTORY/mozilla-nss.pc ${INSTALL_ROOT}/usr/include/nss/    &&
  cp -v $SCRIPT_DIRECTORY/mozilla-nspr.pc ${INSTALL_ROOT}/usr/include/nspr/  &&
  cp -v $SCRIPT_DIRECTORY/mozilla-nss.pc ${INSTALL_ROOT}/usr/lib/pkgconfig/  &&
  cp -v $SCRIPT_DIRECTORY/mozilla-nspr.pc ${INSTALL_ROOT}/usr/lib/pkgconfig/ &&
  cp -vaL ../bin/* ${INSTALL_ROOT}/usr/bin/
)  >  ${C_FIFO}  2>&1

