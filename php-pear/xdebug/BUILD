PHP_EXT=$(php-config --extension-dir)

(

  phpize &&
  ./configure --enable-xdebug $OPTS &&
  make &&

  prepare_install &&
  make    install

) >$C_FIFO 2>&1 && (

  echo "Add the following to /etc/php.ini: extension=\"$PHP_EXT/xdebug.so\""

)
