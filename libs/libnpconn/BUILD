(

  sedit  "s:/usr/local/:/usr/:g"  include/config.makefile  &&
  cd  ${SOURCE_DIRECTORY}/src                              &&
  make                                                     &&
  prepare_install                                          &&
  make    install

) > $C_FIFO 2>&1
