patch  -p1  <  ${SCRIPT_DIRECTORY}/gcc-3.3.patch   &&
#OPTS="${OPTS}  --disable-nas"                      &&
CFLAGS="$CFLAGS -I/usr/X11R6/include"              &&
sedit  's:SND_LIB_MAJOR>0 || \(.*SND_LIB_MINOR==5.*\):\1:'  configure  &&
default_build
