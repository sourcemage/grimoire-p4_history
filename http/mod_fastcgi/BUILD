(

  message "${MESSAGE_COLOR}Checking for Apache 2.x${DEFAULT_COLOR}" &&
  httpd -v | grep -q "Apache/2\." &&

  patch -p1 < $SCRIPT_DIRECTORY/Makefile.patch &&
  mv Makefile.AP2 Makefile &&
  make &&
  prepare_install &&
  make install

) > $C_FIFO 2>&1
