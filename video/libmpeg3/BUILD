(

  patch -p1 < $SCRIPT_DIRECTORY/libmpeg3-1.5.0.patch  &&

  ( echo $CFLAGS | grep -q -- "-O." ) || CFLAGS="$CFLAGS -O2"
  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
