(
#  default_build
  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
  sedit "s/-Werror//" libparted/fs_ext2/Makefile &&
  make                   &&
  prepare_install        &&
  make    install        

) > $C_FIFO 2>&1
