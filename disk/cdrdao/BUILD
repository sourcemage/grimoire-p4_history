(
  if [ "$CVS" = "yes" ] ; then ./autogen.sh ; fi &&
  sedit  's:/usr/src/linux/include::'  scsilib/DEFAULTS/Defaults.linux &&
  sedit  's/xdao=xdao/xdao=no/'  configure    &&
  sedit  's:#include <linux/sysctl.h>::'  dao/dao.cc  &&
  default_build

) > ${C_FIFO} 2>&1
