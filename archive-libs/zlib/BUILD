CFLAGS="$CFLAGS -DPIC -fPIC"  &&

rm  -f  ${INSTALL_ROOT}/usr/X11R6/include/zlib.h
rm  -f  ${INSTALL_ROOT}/usr/X11R6/lib/libz.a
sedit  "s/-O/$CFLAGS/"  Makefile                   &&

./configure  --prefix=${INSTALL_ROOT}/usr  \
             --shared                      \
             $OPTS                         &&
make
