(

  cd  $SOURCE1_DIRECTORY/unix        &&
  ./configure  --prefix=/usr         &&
  make                               &&

  prepare_install                    &&
  cd  $SOURCE1_DIRECTORY/unix        &&
  make    install                    &&
  cd  /                              &&
  rm_source_dir  $SOURCE1_DIRECTORY

) > $C_FIFO 2>&1
