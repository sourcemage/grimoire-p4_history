(
  cd source
  sed s/gsave$/'gsave\\n\\'/ metaps.c > temp.c &&
  mv temp.c metaps.c &&
  make  INSTALL_DIR=${INSTALL_ROOT}/usr	&&
  prepare_install			&&
  make  install  INSTALL_DIR=${INSTALL_ROOT}/usr

) > $C_FIFO 2>&1
