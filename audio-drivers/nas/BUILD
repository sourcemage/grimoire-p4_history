( 

  xmkmf								 &&
  make  World &&
#  make  WORLDOPTS='-k CDEBUGFLAGS="$(CDEBUGFLAGS) -DSTARTSERVER"' World &&
  prepare_install                                                &&
  cd    $SOURCE_DIRECTORY                                        &&
  make  install                                                  &&
  make  install.man        &&
  [  -f  /etc/nas/nasd.conf  ]  ||  cp /etc/nas/nasd.conf.eg /etc/nas/nasd.conf


) > $C_FIFO 2>&1 
