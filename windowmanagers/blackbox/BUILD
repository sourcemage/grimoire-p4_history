sedit '30a\
#include <cassert>\' src/Window.cc     &&
export 	LC_ALL=en_US	               &&
./configure  --build=$BUILD            \
             --prefix=/usr             \
             --sysconfdir=/etc         \
             --infodir=/usr/share/info \
             --mandir=/usr/share/man   \
             --localstatedir=/var      \
             $OPTS                     &&
make
