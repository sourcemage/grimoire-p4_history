(

  make  PREFIX=/usr                         \
    CFLAGS="${CFLAGS}"                      &&
  prepare_install                           &&
  install  -m  755  -o  root  -g  root      \
    docker  /usr/bin

)  >  ${C_FIFO}  2>&1
