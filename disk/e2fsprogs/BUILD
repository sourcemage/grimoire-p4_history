(

  ./configure  --host=${BUILD}      \
               --prefix=/usr        \
               --with-root-prefix=  \
               --enable-elf-shlibs  \
               ${OPTS}              &&
  make                              &&
  prepare_install                   &&
  make    install                   &&
  make    install-libs              &&

  install  -d  /devices
  install  -d  /usr/include/uuid
  install  -m  644  lib/uuid/libuuid.a  /usr/lib
  install  -m  644  lib/uuid/uuid.h     /usr/include/uuid

)  >  ${C_FIFO}  2>&1
