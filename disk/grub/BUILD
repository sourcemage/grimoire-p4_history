unset  CFLAGS            &&
unset  CXXFLAGS          &&
export  CFLAGS="-Os -g"  &&

./configure  --build=$BUILD           \
            --prefix=/usr             \
           --sbindir=/sbin            \
            --mandir=/usr/share/man   \
           --infodir=/usr/share/info  \
           $OPTS                      &&
make
