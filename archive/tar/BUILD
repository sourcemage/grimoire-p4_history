(

  patch  -p1  <  $SCRIPT_DIRECTORY/dotdotpatch.diff  &&

  ./configure  --build=$BUILD                        \
              --prefix=${INSTALL_ROOT}/usr           \
          --libexecdir=${INSTALL_ROOT}/bin           \
              --bindir=${INSTALL_ROOT}/bin           \
                       $OPTS                         &&
  make                                               &&
  prepare_install                                    &&
  cp  src/tar        ${INSTALL_ROOT}/bin             &&
  cp  doc/tar.info*  ${INSTALL_ROOT}/usr/info        &&
  install-info  --info-dir=${INSTALL_ROOT}/usr/info  \
                  ${INSTALL_ROOT}/usr/info/tar.info  &&
  cp $SCRIPT_DIRECTORY/tar.1.gz                      \
     ${INSTALL_ROOT}/usr/man/man1

) > $C_FIFO 2>&1
