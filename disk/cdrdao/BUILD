(

  export CFLAGS="${CFLAGS/-O?/}"              &&
  export GTK_MM_CONFIG=/usr/bin/gtkmm-config  &&
  rm  -f  config.cache                        &&
  ./configure  --prefix=/usr                  &&
  make                                        &&
  prepare_install                             &&
  make    install

) > $C_FIFO 2>&1
