(

  cd  $SOURCE_DIRECTORY/unix         &&
  ./configure  --prefix=/usr $OPTS   &&
  make                               &&

  prepare_install                    &&
  cd  $SOURCE_DIRECTORY/unix         &&
  make    install                    &&
  ln  -sf  tclsh8.4  /usr/bin/tclsh

) > $C_FIFO 2>&1
