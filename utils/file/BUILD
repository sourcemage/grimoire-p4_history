patch  -p1  <  ${SCRIPT_DIRECTORY}/zisofs.patch        &&

./configure  --host=$HOST                              \
             --build=$BUILD                            \
             --prefix=/usr                             \
             --datadir=/usr/share/misc                 \
             $OPTS                                     &&
make
