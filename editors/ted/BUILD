(

  DEST=${INSTALL_ROOT}/usr/share/ted				&&
  patch -p0 < $SCRIPT_DIRECTORY/mk.diff tedPackage/makefile.in	&&

  make CONFIGURE_OPTIONS="--prefix=${DEST} $OPTS" compile.shared&&
  make package.shared						&&
  prepare_install						&&
  cd tedPackage/scratch						&&
  mkdir -p $DEST						&&
  cp -a afm ind Ted $DEST					&&
  cp bin/* Ted/*.sh ${INSTALL_ROOT}/usr/bin			&&
  cp Ted/*.1 ${INSTALL_ROOT}/usr/share/man/man1

) > $C_FIFO 2>&1
