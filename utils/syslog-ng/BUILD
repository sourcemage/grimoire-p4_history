sedit  "s/-O2/$CFLAGS/"  configure

./configure  --build=$BUILD                            \
             --prefix=${INSTALL_ROOT}/usr              \
             --sysconfdir=${INSTALL_ROOT}/etc          \
             --localstatedir=${INSTALL_ROOT}/var/run   \
             --sbindir=${INSTALL_ROOT}/sbin            \
             $OPTS                                     &&

make
