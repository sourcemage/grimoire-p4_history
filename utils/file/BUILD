patch  -p1  <  ${SCRIPT_DIRECTORY}/zisofs.patch        &&

./configure  --host=$HOST                              \
             --build=$BUILD                            \
             --prefix=/usr                             \
             --datadir=/usr/share/misc                 \
             --mandir=/usr/share/man                   \
             $OPTS                                     &&
make
