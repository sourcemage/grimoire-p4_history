(

  cp  monocharge*/*.dll class/lib                            &&
  cp  monocharge*/*.exe mcs                                  &&
  echo  "prefix=${INSTALL_ROOT}/usr"  >>  build/config.make  &&
  echo  "CFLAGS=${CFLAGS}"            >>  build/config.make  &&

  make             &&
  prepare_install  &&
  make  install

)  >  ${C_FIFO}  2>&1
