patch  -p1  <  $SCRIPT_DIRECTORY/alsa-1.0.patch  &&
sedit  's/gmake/make/'  adm_lavcodec/Makefile    &&
# this is recommended by the author
CFLAGS=${CFLAGS/-O3/-O2}      &&
CXXFLAGS=${CXXFLAGS/-O3/-O2}  &&
default_build
