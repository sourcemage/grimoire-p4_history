(

  patch -p0 < $SCRIPT_DIRECTORY/Makefile-shared.patch  &&

  if ! echo $CFLAGS | grep -q -- "-O."; then
    CFLAGS="$CFLAGS -O2"
  fi
  if echo $CFLAGS | grep -q -- "-mmmx"; then
    USE_MMX=1
  else
    USE_MMX=0
  fi
  make USE_MMX=$USE_MMX  &&
  prepare_install        &&
  make    install
  
) > $C_FIFO 2>&1
