patch -p0 < $SCRIPT_DIRECTORY/configure.in.shared-ffmpeg.patch  &&
autoconf  &&
sh ./configure  --prefix=${INSTALL_ROOT}/usr         \
                --sysconfdir=${INSTALL_ROOT}/etc     \
                --localstatedir=${INSTALL_ROOT}/var  \
                --without-mysql                      \
                --without-pgsql                      \
                $OPTS                                &&
make
