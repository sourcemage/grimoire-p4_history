
. $SCRIPT_DIRECTORY/../../kernels/2.4-kernel-headers/functions &&
prebuild_setup_headers  &&
(
  if /lib/libc.so.6 | grep -q NPTL; then
  patch -p1 < $SCRIPT_DIRECTORY/headers.patch  &&
  fi                                           &&
  make  ROOT=                                  &&
  prepare_install                              &&
  make  ROOT= install                                              

) > $C_FIFO 2>&1 
postbuild_bind_unmount

