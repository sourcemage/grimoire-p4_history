if  [  "$CVS"  ==  "y"  ];  then 
	patch -p0 < $SCRIPT_DIRECTORY/pekwm-shape.diff
fi  &&
if [ "$HARBOUR" == y ]; then
  OPTS="$OPTS --enable-harbour"
fi  &&
if [ "$XINERAMA" == y ]; then
  OPTS="$OPTS --enable-xinerama"
fi  &&
default_build
