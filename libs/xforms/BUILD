(

  cp -fv $SCRIPT_DIRECTORY/Imakefile $SOURCE_DIRECTORY  &&

  xmkmf -a                                              &&
  make Makefiles                                        &&
  make includes                                         &&
  make depend                                           &&
  make                                                  &&
  prepare_install                                       &&
  make    install

) > $C_FIFO 2>&1
