(

  patch -p1 < $SCRIPT_DIRECTORY/libmpeg3-1.5.0.patch  &&

  if  !  (echo $CFLAGS | grep -q -- "-O"); then
    export CFLAGS="$CFLAGS -O"
  fi  &&
  
  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
