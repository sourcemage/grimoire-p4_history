patch -p0 < ${SCRIPT_DIRECTORY}/Makefile.am.patch  &&
patch -p0 < ${SCRIPT_DIRECTORY}/gcc-3.4.patch      &&
/bin/sh ./bootstrap                                &&
OPTS="$OPTS --with-mp4v2"                          &&
default_build
