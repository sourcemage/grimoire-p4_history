( 
  ### working ??
  export BUILD_OPT=1
  cd security/nss                                   &&
  make nss_build_all                                &&
  ### cheating to get them all in one place
  make install                                      &&
  ### manually do the real install
  prepare_install                                   &&
  sedit "s/usr\/local/usr/g" $SOURCE_DIRECTORY/nsprpub/Linux2.4_x86_glibc_PTH_OPT.OBJ/config/nspr-config  &&
  cp $SOURCE_DIRECTORY/nsprpub/Linux2.4_x86_glibc_PTH_OPT.OBJ/config/nspr-config ${INSTALL_ROOT}/usr/bin/ && 
  cd $SOURCE_DIRECTORY/dist                         &&
  rm -rf public/seccmd/z*                           &&
  cp -aL public/* ${INSTALL_ROOT}/usr/include/      &&
  cp -aL private ${INSTALL_ROOT}/usr/include/       &&
  cd Linux2.4_x86_glibc_PTH_OPT.OBJ/lib/            &&
  rm -rf libzlib.a libssl*                          &&
  cp -L * ${INSTALL_ROOT}/usr/lib/                  &&
  cp -aL ../include/* ${INSTALL_ROOT}/usr/include/  &&
  cd ../bin                                         &&
  rm -rf *.so nsinstall                             &&
  cp -L * ${INSTALL_ROOT}/usr/bin 
)  >  ${C_FIFO}  2>&1
