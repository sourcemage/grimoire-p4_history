

patch -p0 < $SCRIPT_DIRECTORY/xchat-2.4.1.patch    &&
./configure  --build=$BUILD                     \
             --prefix=/usr                      \
             --sysconfdir=/etc                  \
             --localstatedir=/var               \
             $OPTS                              &&
make                                           
