# fix for gcc-3.4
  sed -i "/^extern/d" scaffold.c                        &&
  patch  -p 1  <  $SCRIPT_DIRECTORY/tcp_wrappers.patch  &&

  make  REAL_DAEMON_DIR=${INSTALL_ROOT}/usr/sbin linux  
