(
  VV=`uname -r| cut -d. -f-2`			&&
  ln -s $VV/drivers 				&&
  ln -s $VV/include 				&&
  sedit "s/-O2/${CFLAGS}/" drivers/Makefile	&&
  make all              			&&
  prepare_install       			&&
  make    install        

) > $C_FIFO 2>&1
