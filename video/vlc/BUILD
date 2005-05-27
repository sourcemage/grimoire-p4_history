if  [  "$JOYSTICK"  =  "y"  ];  then
  export OPTS="$OPTS --enable-joystick"
fi  &&
if  [  "$V4L" = "y"  ];  then
  export OPTS="$OPTS --enable-v4l"
fi  &&

export OPTS="$OPTS --disable-dependency-tracking --enable-release"  &&

if test "$(get_spell_provider $SPELL GECKO)" = firefox; then
  OPTS="$OPTS MOZILLA_CONFIG=/usr/bin/firefox-config"
fi  &&

make_single    &&
default_build  &&
make_normal
