(

  cp $SCRIPT_DIRECTORY/sgl-Makefile $SOURCE_DIRECTORY/Makefile &&
  make PREFIX=/usr                  &&
  prepare_install                   &&
  make PREFIX=/usr   install

) > $C_FIFO 2>&1
