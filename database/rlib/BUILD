(
# to fix Python error
  sedit "s/-Werror//" configure.in		 &&
  autoconf					 &&
  default_build
#  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
#  make                   &&
#  prepare_install        &&
#  make    install        

) > $C_FIFO 2>&1
