local sedtarget
for sedtarget in Makefile.in $(find doc -name Makefile.in); do
  sedit  's:$(prefix)/LessTif:$(prefix)/share/doc/lesstif:g'  $sedtarget
done  &&
export OPTS="$OPTS --enable-production --disable-debug --enable-static"    &&
export OPTS="$OPTS --enable-build-12 --enable-build-20 --enable-build-21"  &&
# for some reason lesstif 0.93.95 fails to set those, breaking ddd compilation
sedit 's/_MAJOR_VERSION_/0/g'   include/Motif-2.1/Xm/Xm.h.in  &&
sedit 's/_MINOR_VERSION_/93/g'  include/Motif-2.1/Xm/Xm.h.in  &&
sedit 's/_PICO_VERSION_/95/g'   include/Motif-2.1/Xm/Xm.h.in  &&
default_build
