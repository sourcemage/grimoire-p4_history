# don't make it track all info files in /usr/share/info
sedit  's:${COPYDESTS} ${infodir}:${COPYDESTS}:'  Makefile.in  &&
# Fixes Bug #2938
export  LDFLAGS="${LDFLAGS/-z combreloc/}"  &&
default_build
