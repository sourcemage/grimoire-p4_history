(
  patch -p1 < $SCRIPT_DIRECTORY/system_config_file-papuawm.patch    &&
  default_build                                                     &&
  [  -e  ${INSTALL_ROOT}/etc/papuawm.conf  ]                        ||
  cp  ${SCRIPT_DIRECTORY}/papuawm.conf ${INSTALL_ROOT}/etc/papuawm.conf

) > $C_FIFO 2>&1
