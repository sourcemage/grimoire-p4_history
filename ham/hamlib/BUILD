(

  unset  CFLAGS
  unset  CXXFLAGS
  unset  LDFLAGS

  ./configure  --prefix=/usr $OPTS   &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
