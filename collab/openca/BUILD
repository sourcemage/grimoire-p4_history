local COUNTRY=${LANG##*-}

./configure  --build=$BUILD                     \
             --prefix=/usr                      \
             --sysconfdir=/etc                  \
             --localstatedir=/var               \
             --with-web-host=`hostname`         \
             --with-httpd-host=nobody           \
             --with-httpd-user=nogroup          \
             --with-ca-organization=`hostname`  \
             --with-ca-country=${COUNTRY:-US}   \
             $OPTS                              &&
make
