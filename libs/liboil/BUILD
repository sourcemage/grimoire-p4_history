# fix configure so it doesn't ignore CFLAGS and so it always sets -mmmx
# (the cpu is detected at runtime, but -mmmx is necessary to compile)
patch  configure  $SCRIPT_DIRECTORY/liboil-configure-fix.diff  &&
make_single    &&
default_build  &&
make_normal
