(

  patch -p0 < $SCRIPT_DIRECTORY/Makefile-shared.patch  &&

  ( echo $CFLAGS | grep -q -- "-O." ) || CFLAGS="$CFLAGS -O2"
  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
