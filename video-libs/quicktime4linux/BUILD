(

  patch -p0 < $SCRIPT_DIRECTORY/Makefile.patch  &&

  sedit "s/-msse/$CFLAGS/"  Makefile.ffmpeg     &&
  ( echo $CFLAGS | grep -q -- "-msse" )  || \
    echo "#undef HAVE_BUILTIN_VECTOR" >>    \
    ffmpeg-0.4.8/libavcodec/dsputil.h           &&
  
  ( echo $CFLAGS | grep -q -- "-O." ) || CFLAGS="$CFLAGS -O2"  &&
  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
