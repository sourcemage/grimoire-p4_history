(

  mkdir  build                          &&
  cd     build                          &&
  chmod 755 ../src/unix/util/mkfrags    &&
  ../src/unix/configure  --prefix=/usr  &&
  make                                  &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1  &&  (

  mkdir   -p                      /usr/share/squeak      &&
  cd                              /usr/share/squeak      &&
  unpack  $SOURCE2  ${MD5[1]}                            &&
  cp      $SOURCE_CACHE/$SOURCE2  .                      &&
  gunzip  $SOURCE2                                       &&

  mkdir   -p                      /usr/share/squeak/3.0  &&
  cd                              /usr/share/squeak/3.0  &&
  unpack  $SOURCE3  ${MD5[2]}                            &&
  cp      $SOURCE_CACHE/$SOURCE3  .                      &&
  unpack  $SOURCE4  ${MD5[3]}                            &&
  cp      $SOURCE_CACHE/$SOURCE4  .                      &&
  gunzip  $SOURCE3                                       &&
  gunzip  $SOURCE4

)
