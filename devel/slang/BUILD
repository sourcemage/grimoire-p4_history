(

  ./configure  --build=$BUILD        \
               --prefix=$INSTALL_ROOT/usr         \
               --sysconfdir=$INSTALL_ROOT/etc     \
               --localstatedir=$INSTALL_ROOT/var  \
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
