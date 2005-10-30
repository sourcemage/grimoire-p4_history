unset  CFLAGS

if [ "$MMX" == "n" ]; then
  OPTS="$OPTS --disable-mmx"
fi                                 &&

./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make
