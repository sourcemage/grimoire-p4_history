(
  patch  Makefile  $SCRIPT_DIRECTORY/Makefile.patch  &&

  make USE_LOG=false DEBUG=false     &&
  prepare_install                    &&
  make  install                      &&
  install -d ${INSTALL_ROOT}/sys     &&
  UDEV_CFG=${INSTALL_ROOT}/etc/udev  &&
  mkdir  -p  ${UDEV_CFG}             &&
  DFS=etc/udev/udev.rules.devfs      &&
  if [ ! -f ${INSTALL_ROOT}/$DFS ];then
    cp $DFS ${INSTALL_ROOT}/$DFS 
  fi  &&
  if [ ! -f ${UDEV_CFG}/udev.conf ]; then
    cp $SCRIPT_DIRECTORY/udev.conf  ${UDEV_CFG}
  fi  &&
  if [ ! -f ${UDEV_CFG}/udev.permissions ]; then
    cp $SCRIPT_DIRECTORY/udev.permissions  ${UDEV_CFG}
  fi  &&
  if [ ! -f ${UDEV_CFG}/udev.rules ]; then
    cp $SCRIPT_DIRECTORY/udev.rules  ${UDEV_CFG}
  fi  &&
  if [ ! -f ${UDEV_CFG}/udev.missing ]; then
    cp $SCRIPT_DIRECTORY/udev.missing  ${UDEV_CFG}
  fi

) > ${C_FIFO} 2>&1
