sedit  "s/-O2/$CFLAGS/"  configure

./configure  --build=$BUILD             \
             --prefix=/usr              \
             --sysconfdir=/etc          \
             --localstatedir=/var/run   \
             --sbindir=/sbin            \
             $OPTS                      &&

make
