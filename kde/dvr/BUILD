(

  cd dvr &&
  sedit "s/-O2 -march=i586/$CXXFLAGS/" Makefile &&
  cd ..
  make               &&
  prepare_install               &&
  make   install     

) > $C_FIFO 2>&1
