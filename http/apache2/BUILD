# remove APR and APU and reconfigure to use external ones
rm -fr srclib/apr*/ &&
patch -p1 < $SCRIPT_DIRECTORY/build.diff &&
patch -p1 < $SCRIPT_DIRECTORY/apache-patches-2.0.52-r1.tar.bz2 &&

./buildconf --with-apr=/usr/share/apache2 --with-apr-util=/usr/share/apache2 &&

./configure  --prefix=$INSTALL_ROOT/usr            \
             --sysconfdir=$INSTALL_ROOT/etc/httpd  \
             --localstatedir=$INSTALL_ROOT/var     \
             --mandir=$INSTALL_ROOT/usr/share/man  \
             --enable-layout=GNU                   \
             --enable-modules=most,max             \
             $OPTS  &&
make
