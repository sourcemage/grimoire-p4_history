(

  ./configure  --build=$BUILD              \
               --prefix=/usr               \
               --datadir=/usr/share/bison  \
               $OPTS                       &&
  make                                     &&
  prepare_install                          &&
  make    install                          &&
  cp  $SCRIPT_DIRECTORY/yacc  /usr/bin

) > $C_FIFO 2>&1
