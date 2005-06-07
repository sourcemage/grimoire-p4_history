# they're using CPPFLAGS instead of CXXFLAGS
export CPPFLAGS="$CXXFLAGS -I/usr/include/lzo" &&
patch -p1 < $SCRIPT_DIRECTORY/lzo2.diff &&
default_build
