(

  # Fixes Bug #1108
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sbindir=/sbin       \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  ln  -sf  /sbin/reiserfsck          \
           /sbin/fsck.reiserfs

) > $C_FIFO 2>&1
