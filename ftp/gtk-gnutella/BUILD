if  [  "$GNUTELLA_GTK"  =  "1.x"  ];  then
  OPTS="${OPTS} -Dgtkversion=1
else
  OPTS="${OPTS} -Dgtkversion=2
fi  &&

./Configure  -d  -e  -r  -s -O            \
            -Dprefix=${INSTALL_ROOT}/usr  \
        -Dsysconfdir=${INSTALL_ROOT}/etc  \
     -Dlocalstatedir=${INSTALL_ROOT}/var  \
                -Dcc=/usr/bin/gcc         \
                     $OPTS                &&
make
