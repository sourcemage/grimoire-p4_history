#sedit  "s:/usr/local:$INSTALL_ROOT/usr:"  configure     &&
#sedit  "s:/usr/local:$INSTALL_ROOT/usr:"  settings.pro  &&
invoke_gcc
QTDIR=${QTDIR:-$INSTALL_ROOT/usr}                       &&
./configure  --prefix=/usr $OPTS                        &&
qmake  mythtv.pro                                       &&
make
