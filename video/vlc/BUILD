(

  patch -p1 < $SCRIPT_DIRECTORY/ffmpeg.patch  &&

  if  [  "$JOYSTICK"  =  "y"  ];  then
    export OPTS="$OPTS --enable-joystick"
  fi  &&

  export OPTS="$OPTS --disable-dependency-tracking --enable-release"  &&
  # mozilla broke the api again :(
  export OPTS="$OPTS --disable-mozilla"  &&

  # needed for xvid detection
  export LDFLAGS="$LDFLAGS -lm"  &&

  default_build

) > $C_FIFO 2>&1
