(

  patch -p1 < $SCRIPT_DIRECTORY/xmovie-1.9.9-shared.patch  &&
  
  ( echo $CFLAGS | grep -q -- "-O." ) || CFLAGS="$CFLAGS -O2"
  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
