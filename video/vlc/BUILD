(

  patch  -p1  <  $SCRIPT_DIRECTORY/mkv-fix.patch  &&

  if  [  "$JOYSTICK"  =  "y"  ];  then
    export OPTS="$OPTS --enable-joystick"
  fi  &&

  export OPTS="$OPTS --disable-dependency-tracking --enable-release"  &&

  default_build

) > $C_FIFO 2>&1
