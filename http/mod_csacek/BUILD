(

  message "${MESSAGE_COLOR}Checking for Apache 1.x${DEFAULT_COLOR}" &&
  httpd -v | grep -q "Apache/1\." &&

  configure --with-target=Apache &&
  
  make 	           &&
  prepare_install  &&
  cp $SOURCE_DIRECTORY/mod_csacek.so /usr/libexec/

) >$C_FIFO 2>&1
