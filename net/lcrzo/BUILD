(

  sedit  "s/local\///"  src/genemake 

  cd src               &&
  ./genemake           &&
  make                 &&
  prepare_install      &&
  make install

) > $C_FIFO 2>&1
