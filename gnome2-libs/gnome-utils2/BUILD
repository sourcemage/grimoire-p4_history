. $SCRIPT_DIRECTORY/../../kernels/2.4-kernel-headers/functions &&
prebuild_setup_headers  &&
(
  OPTS="$OPTS --enable-gdialog"
  default_build
) > $C_FIFO 2>&1
postbuild_bind_unmount

