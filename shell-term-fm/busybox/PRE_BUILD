
  if  [  -f  $CONFIG_CACHE/busybox.config  ]; then
      cp  ${CONFIG_CACHE}/busybox.config  .config
  else
      cp  ${SCRIPT_DIRECTORY}/busybox.config  .config  
  fi

  if  [  "$BB_CONFIG"  ==  "y"  ];  then
      make  "menuconfig"
  fi
  
  cp  .config  ${CONFIG_CACHE}/busybox.config

(
 
  sedit  "s:OPTIMIZATION=\${call check_gcc,-Os,-O2}:OPTIMIZATION=${CFLAGS}:" Rules.mak	&&
  sedit  "s:OPTIMIZATION+=-march=i386::" Rules.mak					&&
  make  dep						&&
  make							&&

  prepare_install  					&&

  install  -m  755  busybox  ${INSTALL_ROOT}/sbin

#  This one is needed only when symlinks needed ...
#  make  PREFIX=/  install


) > $C_FIFO 2>&1
