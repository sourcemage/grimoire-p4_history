(

  patch  -p1  <  $SCRIPT_DIRECTORY/mkv-fix.patch  &&
  sedit  's/0.7.20-cdio/0.7.20/'  configure       &&

  if  [  "$JOYSTICK"  =  "y"  ];  then
    export OPTS="$OPTS --enable-joystick"
  fi  &&

  export OPTS="$OPTS --disable-dependency-tracking --enable-release"  &&

  default_build

) > $C_FIFO 2>&1
