(
  cd $SOURCE_DIRECTORY					&&
  rm -f upn						&&
  echo gcc upn.c -o upn -lm ${CFLAGS} ${LDFLAGS}	&&
  gcc upn.c -o upn -lm ${CFLAGS} ${LDFLAGS}		&&
  prepare_install					&&
  install upn /usr/bin					&&
  install upn.1 /usr/man/man1
) > $C_FIFO 2>&1 
