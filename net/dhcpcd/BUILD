(
  # patch to make pidfile go to /var/run
  patch -p0 < $SCRIPT_DIRECTORY/pid-file.patch &&
  
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
