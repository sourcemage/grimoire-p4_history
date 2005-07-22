#
# Remake configure so it doesn't "need" cpp
#
aclocal   &&
autoconf  &&

if  [  -f  /usr/include/linux/fusion.h  ];  then
  OPTS="$OPTS --enable-multi"
fi                                                    &&
export CPPFLAGS="$CPPFLAGS -I/usr/include/libmpeg3/"  &&

./configure  --build=$BUILD                           \
            --prefix=${INSTALL_ROOT}/usr              \
        --sysconfdir=${INSTALL_ROOT}/etc              \
     --localstatedir=${INSTALL_ROOT}/var              \
            --mandir=/usr/share/man                   \
            --infodir=/usr/share/info                 \
             --enable-linux-input                     \
             --with-gfxdrivers=$gfxdrivers            \
             $OPTS                                    &&
make
