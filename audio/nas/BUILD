( 

  xmkmf								 &&
  make  World &&
#  make  WORLDOPTS='-k CDEBUGFLAGS="$(CDEBUGFLAGS) -DSTARTSERVER"' World &&
  prepare_install                                                &&
  cd    $SOURCE_DIRECTORY                                        &&
  make  install                                                  &&
  make  install.man


) > $C_FIFO 2>&1 
