(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  make runtests                      &&
  prepare_install                    &&
  make install                       &&
  make elf                           &&
  make install-elf                   &&
  make install-links                 &&
  make clean

) > $C_FIFO 2>&1
