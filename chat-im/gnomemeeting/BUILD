if [ "$GTK_ONLY" == "y" ]; then
     echo "Building without gnome support"   &&
    ./configure --prefix=${INSTALL_ROOT}/usr              \
                --sysconfdir=${INSTALL_ROOT}/etc/gnomemeeting \
                --localstatedir=${INSTALL_ROOT}/var            \
                --disable-gnome                                 \
                $OPTS
else
echo "Building with gnome support"    &&
./configure --prefix=${INSTALL_ROOT}/usr                  \
            --sysconfdir=${INSTALL_ROOT}/etc/gnomemeeting \
            --localstatedir=${INSTALL_ROOT}/var           \
            $OPTS				  
fi       &&
make             
