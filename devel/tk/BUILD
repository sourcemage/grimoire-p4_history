(

  cd  $SOURCE2_DIRECTORY/unix        &&
  ./configure  --prefix=/usr  $OPTS  &&

  make                               &&
  prepare_install                    &&
  make    install                    &&

  cd  /                              &&
  rm_source_dir  $SOURCE2_DIRECTORY

) > $C_FIFO 2>&1
