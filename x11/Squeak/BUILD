(

  mkdir  build                          &&
  cd     build                          &&
  chmod 755 ../src/unix/util/mkfrags    &&
  ../src/unix/configure  --prefix=/usr  &&
  make                                  &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1  &&  (

  mkdir   -p                      /usr/share/squeak
  cd                              /usr/share/squeak
  cp      $SOURCE_CACHE/$SOURCE2  .
  gunzip  $SOURCE2

  mkdir   -p                      /usr/share/squeak/3.0
  cd                              /usr/share/squeak/3.0  
  cp      $SOURCE_CACHE/$SOURCE3  .
  cp      $SOURCE_CACHE/$SOURCE4  .
  gunzip  $SOURCE3
  gunzip  $SOURCE4

)
