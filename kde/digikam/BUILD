(
  if [ "$USECVS" == "yes" ];then
    sedit "87d" admin/cvs.sh	&&
    make -f  Makefile.cvs
  fi				&&
  default_build

) > $C_FIFO 2>&1
