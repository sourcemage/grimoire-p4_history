(

  sed  "s/local\///g"  $SOURCE_DIRECTORY/Makefile  >  $SOURCE_DIRECTORY/Makefile.new  &&
  make  -f  Makefile.new  &&
  prepare_install         &&
  make -f Makefile.new install

) > $C_FIFO 2>&1
