if [ "$NAUTILUS" == "y" ]; then
   OPTS="$OPTS --disable-vfs-methods"
   patch  -p0  <  $SCRIPT_DIRECTORY/dependency-fix.patch
fi &&

default_build
