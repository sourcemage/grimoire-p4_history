(
  patch -p0 < $SCRIPT_DIRECTORY/massdns.patch
  make &&
  prepare_install &&
  cp massdns /usr/bin/massdns
  
) > $C_FIFO 2>&1
