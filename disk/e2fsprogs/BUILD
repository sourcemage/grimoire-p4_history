(

  ./configure  --host=$BUILD        \
               --prefix=/usr        \
               --with-root-prefix=  \
               --enable-elf-shlibs  &&
  make                              &&
  prepare_install                   &&
  make    install                   &&
  make    install-libs

) > $C_FIFO 2>&1  &&  (

  mkdir  -p  /devices
  mkdir  -p  /usr/include/uuid
  cp  lib/uuid/libuuid.a  /usr/lib
  cp  lib/uuid/uuid.h     /usr/include/uuid

  cp  $SCRIPT_DIRECTORY/mount.sh  /etc/init.d
  ln      -sf ../init.d/mount.sh  /etc/rcS.d/S10mount
  ln      -sf ../init.d/mount.sh  /etc/rc0.d/K90mount
  ln      -sf ../init.d/mount.sh  /etc/rc6.d/K90mount

)
