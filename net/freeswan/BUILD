(

  make programs                               &&
  make module                                 &&
  prepare_install                             &&
  make install                                &&
  KVERSION=`uname -r`
  cp ./linux/net/ipsec/ipsec.o /lib/modules/$KVERSION/net &&
  depmod -ae

) > $C_FIFO 2>&1
