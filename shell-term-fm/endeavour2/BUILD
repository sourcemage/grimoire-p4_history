(

  ./configure  Linux  --prefix=/usr  --CFLAGS="$CFLAGS"  &&
  make             &&
  prepare_install  &&
  make    install  &&
  [  -f  /usr/share/endeavour2/mimetypes.ini  ]  ||
  cp      endeavour2-mimetypes/mimetypes.ini  \
         /usr/share/endeavour2/mimetypes.ini

) > $C_FIFO 2>&1
