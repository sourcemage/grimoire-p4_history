patch  -p0  <  $SCRIPT_DIRECTORY/alsa-1.0.patch  &&
# needed for xvid
export  LDFLAGS="$LDFLAGS -lm"  &&
# breaks with -Os
export  CFLAGS=${CFLAGS/-Os/}  &&
default_build
