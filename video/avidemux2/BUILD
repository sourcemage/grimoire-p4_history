# yes, this is needed, as setting --host + --build like default_build does
# break the compilation, since it somehow leads to a -ansi added to the CFLAGS
(

  # this is recommended by the author
  CFLAGS=${CFLAGS/-O3/-O2}      &&
  CXXFLAGS=${CXXFLAGS/-O3/-O2}  &&
  ./configure  --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               $OPTS  &&
  make                &&
  prepare_install     &&
  make    install

) > $C_FIFO 2>&1
