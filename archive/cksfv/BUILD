(

  cp  -fv  $SCRIPT_DIRECTORY/Makefile     $SOURCE_DIRECTORY               &&
  cp  -fv  $SCRIPT_DIRECTORY/srcMakefile  $SOURCE_DIRECTORY/src/Makefile  &&

  make                                                                    &&
  prepare_install                                                         &&
  make    install

) > $C_FIFO 2>&1
