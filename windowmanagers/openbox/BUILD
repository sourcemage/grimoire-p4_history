(

  patch  -p1  <  $SCRIPT_DIRECTORY/ob-gcc3.3-fix.patch  &&

  export 	LC_ALL=en_US    &&
  ./configure     --prefix=/usr \
                  $OPTS         &&
  make                          &&
  make install

) > $C_FIFO 2>&1
