CFG_BACKUP="$CONFIG_CACHE/user-mode-linux.config"

if  [  -f  $CFG_BACKUP  ]  ;  then
  cp  $CFG_BACKUP  .config
fi                                                      &&

if  [  !  -f  .config  ]  ||  query  "Run menuconfig?"  n  ;  then
  make  ARCH=um  menuconfig
else
  if  query  "Run make oldconfig?"  n  ;  then
    make  ARCH=um  oldconfig
  else
    yes  n  |  make  ARCH=um  oldconfig
  fi
fi                                                      &&

cp  .config  $CFG_BACKUP                                &&

(

  make  ARCH=um  linux                                  &&
  prepare_install                                       &&
  install  -v  -m 755  linux  $INSTALL_ROOT/usr/bin/user-mode-linux

) > $C_FIFO 2>&1
