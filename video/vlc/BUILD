if  [  "$JOYSTICK"  =  "y"  ];  then
  export OPTS="$OPTS --enable-joystick"
fi  &&
if  [  "$V4L" = "y"  ];  then
  export OPTS="$OPTS --enable-v4l"
fi  &&

export OPTS="$OPTS --disable-dependency-tracking --enable-release"  &&

make_single    &&
default_build  &&
make_normal
