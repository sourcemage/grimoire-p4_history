(

  patch -p0 < $SCRIPT_DIRECTORY/configure.in.shared-ffmpeg.patch  &&
  autoconf                                          &&
  sh ./configure  --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               --without-mysql                      \
               --without-pgsql                      \
               $OPTS                                &&
  make                                              &&
  prepare_install                                   &&
  (
    install  motion       ${INSTALL_ROOT}/usr/bin       &&
    install  motion.1     ${INSTALL_ROOT}/usr/man/man1  &&
    install  motion.conf  ${INSTALL_ROOT}/etc
  )

) > $C_FIFO 2>&1
