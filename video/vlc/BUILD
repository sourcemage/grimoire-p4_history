patch -p0 < $SCRIPT_DIRECTORY/live-api-change.patch  &&
if  [  "$JOYSTICK"  =  "y"  ];  then
  export OPTS="$OPTS --enable-joystick"
fi  &&
if  [  "$V4L" = "y"  ];  then
  export OPTS="$OPTS --enable-v4l"
fi  &&

export OPTS="$OPTS --disable-dependency-tracking --enable-release"  &&

default_build
