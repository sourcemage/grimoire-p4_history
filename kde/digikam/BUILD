(
  if [ "$USECVS" == "yes" ];then
    sedit "87d" admin/cvs.sh	&&
    make -f  Makefile.cvs
  fi				&&
  default_build
#  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
#  make                   &&
#  prepare_install        &&
#  make    install        

) > $C_FIFO 2>&1
