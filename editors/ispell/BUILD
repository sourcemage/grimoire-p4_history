(

  cp ${SCRIPT_DIRECTORY}/local.h.smgl local.h

  patch  -p0  <  ${SCRIPT_DIRECTORY}/parse.patch  &&

  make  all        &&
  prepare_install  &&
  make  install					

) > $C_FIFO 2>&1
