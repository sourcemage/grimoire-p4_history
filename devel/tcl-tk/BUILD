(

  cd  $SOURCE_DIRECTORY/unix         &&
  ./configure  --prefix=/usr         &&
  make                               &&

  cd  $SOURCE2_DIRECTORY/unix        &&
  ./configure  --prefix=/usr         &&
  make                               &&

  prepare_install                    &&
  cd  $SOURCE_DIRECTORY/unix         &&
  make    install                    &&
  cd  $SOURCE2_DIRECTORY/unix        &&
  make    install                    &&
  cd  /                              &&
  rm_source_dir  $SOURCE2_DIRECTORY  &&
  ln  -sf  tclsh8.3  /usr/bin/tclsh  &&
  ln  -sf  wish8.3   /usr/bin/wish

) > $C_FIFO 2>&1


  # Temporary fix while other programs transition to TCL 8.4
  #  ln  -sf           libtcl8.4.so  \
  #           /usr/lib/libtcl8.3.so  &&
