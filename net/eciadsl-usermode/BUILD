(

  ./configure  --prefix=/usr  --doc-prefix=/usr  $OPTS  &&
  make                                &&
  prepare_install                     &&
  make  uninstall_dirs  install_dirs  &&
  rm  -rf  /tmp/eciadsl               &&
  make  TMP_DIR=tmp/eciadsl  install  &&
  rm  -rf  /tmp/eciadsl

) > $C_FIFO 2>&1
