./configure  --prefix=/usr         \
             --localstatedir=/var  \
             $OPTS                 &&
make_single                        &&
#
# The order here is important
#
make -C lib/bind                   &&
make -C lib/lwres                  &&
make -C lib/dns                    &&
make -C lib/isc                    &&
make -C lib/isccfg                 &&
cd bin/dig                         &&
make                               &&
make_normal
