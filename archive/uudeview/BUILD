./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $MINEWS               \
             $OPTS                 &&
make all                           &&
prepare_install                    &&
make    install                    &&

cp   uulib/libuu.a      /usr/lib    &&
cp   uulib/uudeview.h  /usr/include &&

ln  -sf  uudeview    /usr/bin/uudecode         &&
ln  -sf  uuenview    /usr/bin/uuencode         &&
ln  -sf  uudeview.1  /usr/man/man1/uudecode.1  &&
ln  -sf  uuenview.1  /usr/man/man1/uuencode.1
