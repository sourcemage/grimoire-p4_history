(
  if  grep  UTS_RELEASE /usr/include/linux/version.h | grep -q \"2.6; then
    patch -p1 < $SCRIPT_DIRECTORY/linux-2.6.patch
  fi  &&
  if /lib/libc.so.6 | grep -q NPTL; then
  patch -p1 < $SCRIPT_DIRECTORY/headers.patch
  fi                                           &&
  make  ROOT=                                  &&
  prepare_install                              &&
  make  ROOT= install                                              

) > $C_FIFO 2>&1 
