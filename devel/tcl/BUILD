(

  cd  $SOURCE_DIRECTORY/unix         &&
  ./configure  --prefix=/usr         &&
  make                               &&

  prepare_install                    &&
  cd  $SOURCE_DIRECTORY/unix         &&
  make    install                    &&
  ln  -sf  tclsh8.4  /usr/bin/tclsh  &&
  ln  -sf  wish8.4   /usr/bin/wish

) > $C_FIFO 2>&1
