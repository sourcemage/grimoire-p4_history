(

  cp -fv $SCRIPT_DIRECTORY/Imakefile $SOURCE_DIRECTORY  &&

  xmkmf -a                                              &&
  make                                                  &&
  prepare_install                                       &&
  make    install                                       &&
  make    install.man

) > $C_FIFO 2>&1
