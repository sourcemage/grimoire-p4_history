# yes, this is needed, as setting --host + --build like default_build does
# breaks the compilation, since it somehow leads to a -ansi added to the CFLAGS
(

  ./configure  --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               $OPTS  &&
  make                &&
  prepare_install     &&
  make    install

) > $C_FIFO 2>&1
