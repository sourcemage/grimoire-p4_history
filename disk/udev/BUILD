(

  make                               &&
  prepare_install                    &&
  make  install                      &&
  DFS=etc/udev/udev.rules.devfs      &&
  if [ ! -f ${INSTALL_ROOT}/$DFS ];then
    cp $DFS ${INSTALL_ROOT}/$DFS 
  fi

) > ${C_FIFO} 2>&1
