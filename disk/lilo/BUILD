(
. $SCRIPT_DIRECTORY/../../kernels/2.4-kernel-headers/functions &&
prebuild_setup_headers ) &&
(
  patch -p1 < $SCRIPT_DIRECTORY/headers.patch  &&
  make  ROOT=                                  &&
  prepare_install                              &&
  make  ROOT= install                                              

) > $C_FIFO 2>&1 

. $SCRIPT_DIRECTORY/../../kernels/2.4-kernel-headers/functions 
postbuild_bind_unmount
