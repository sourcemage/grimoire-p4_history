(
  [ "$CVS" = "yes" ] && ./autogen.sh          ;
  sedit  's/xdao=xdao/xdao=no/'  configure    &&
  sedit  's:#include <linux/sysctl.h>::'  dao/dao.cc  &&
  default_build

) > ${C_FIFO} 2>&1
