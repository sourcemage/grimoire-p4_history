(

  message "${MESSAGE_COLOR}Checking for Apache 2.x${DEFAULT_COLOR}" &&
  httpd -v | grep -q "Apache/2\." &&
  default_build

) > $C_FIFO 2>&1
