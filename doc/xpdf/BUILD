export    CFLAGS="$CFLAGS -I/usr/include/freetype2"
export  CXXFLAGS="$CFLAGS"
export  CPPFLAGS="$CPPFLAGS -I/usr/include/freetype2"

export      OPTS="$OPTS --enable-multithreaded"
patch -p1 < $SCRIPT_DIRECTORY/freetype2.patch   &&
pushd xpdf                                      &&
patch -p0 < $SOURCE_CACHE/$SOURCE2              &&
popd                                            &&
default_build
