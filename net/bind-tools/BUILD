./configure  --prefix=/usr         \
             --localstatedir=/var  \
             $OPTS                 &&
make -C lib/dns                    &&
make -C lib/isc                    &&
cd bin/dig                         &&
make
