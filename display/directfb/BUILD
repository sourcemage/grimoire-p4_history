if  [  -f  /usr/include/linux/fusion.h  ];  then
  OPTS="$OPTS --enable-multi"
fi                                                    &&
export CPPFLAGS="$CPPFLAGS -I/usr/include/libmpeg3/"  &&

./configure  --build=$BUILD                           \
            --prefix=${INSTALL_ROOT}/usr              \
        --sysconfdir=${INSTALL_ROOT}/etc              \
     --localstatedir=${INSTALL_ROOT}/var              \
             --enable-linux-input                     \
             --with-gfxdrivers=$gfxdrivers            \
             $OPTS                                    &&
make
