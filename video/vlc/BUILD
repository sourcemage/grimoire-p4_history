(

  patch  -p1  <  $SCRIPT_DIRECTORY/gcc-3.4.patch                        &&
  patch  modules/stream_out/transcode.c $SCRIPT_DIRECTORY/ffmpeg.patch  &&

  if  [  "$JOYSTICK"  =  "y"  ];  then
    export OPTS="$OPTS --enable-joystick"
  fi  &&

  export OPTS="$OPTS --disable-dependency-tracking --enable-release"  &&

  # needed for libdts detection
  LDFLAGS="$LDFLAGS -lm"  &&

  default_build

) > $C_FIFO 2>&1
