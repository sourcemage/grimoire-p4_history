(

  ./configure  --host=${BUILD}               \
               --prefix=${INSTALL_ROOT}/usr  \
               --with-root-prefix=           \
               --enable-elf-shlibs           \
               ${OPTS}                       &&
  make                                       &&
  prepare_install                            &&
  make    install                            &&
  make    install-libs                       &&

  install  -d  ${INSTALL_ROOT}/usr/include/uuid       &&
  install  -m  644  lib/uuid/libuuid.a                \
                    ${INSTALL_ROOT}/usr/lib           &&
  install  -m  644  lib/uuid/uuid.h                   \
                    ${INSTALL_ROOT}/usr/include/uuid

)  >  ${C_FIFO}  2>&1
