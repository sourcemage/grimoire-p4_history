(

  message "${MESSAGE_COLOR}Checking for Apache 2.x${DEFAULT_COLOR}" &&
  httpd -v | grep -q "Apache/2\." &&

  make &&
  prepare_install &&
  make install

) > $C_FIFO 2>&1
