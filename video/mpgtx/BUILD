(

  sedit  's/gcc --version/gcc -dumpversion/'  configure  &&
  sedit  "s:/usr/local:${INSTALL_ROOT}/usr:"  configure  &&
  # non-standard configure
  ./configure --no-LFS  &&
  make                                      &&
  prepare_install                           &&
  make    install

) > $C_FIFO 2>&1
