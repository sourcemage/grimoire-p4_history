(
patch -p1 < $SCRIPT_DIRECTORY/kdebindings-3.1.4.patch &&
make -f admin/Makefile.common cvs                     &&
  ./configure  --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               --disable-debug                      \
               --enable-final                       \
               --without-java                       \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
