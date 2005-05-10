LDFLAGS="$LDFLAGS -L$SOURCE_DIRECTORY/speex/libspeex/.libs"

[[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"
invoke_gcc
./configure --prefix=${INSTALL_ROOT}/usr  \
        --sysconfdir=${INSTALL_ROOT}/etc  \
     --localstatedir=${INSTALL_ROOT}/var  \
            --mandir=${INSTALL_ROOT}/usr/share/man   \
           --infodir=${INSTALL_ROOT}/usr/share/info  \
                     $OPTS                 &&
cd libr263  &&
make library &&
cd .. &&
cd speex && 
make && 
cd .. &&
make
