(

  # Remove all references to their init.d script
  patch  -p0  <  ${SCRIPT_DIRECTORY}/init.d.patch  &&
  prepare_install  &&
  make install

) > $C_FIFO 2>&1
