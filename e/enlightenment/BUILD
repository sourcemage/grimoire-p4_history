if [ "$DR17" = "y" ]; then
  if  [  "$E_SLOWDOWN"  ==  "y"  ];  then
    patch  -p1  <  $SCRIPT_DIRECTORY/noslowdown.patch
  fi  &&
  ./autogen.sh
fi  &&

OPTS="$OPTS --enable-fsstd"  &&
default_build
