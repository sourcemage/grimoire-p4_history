(

  patch -p0 < $SCRIPT_DIRECTORY/wordnet-1.7.config  &&
  prepare_install                                   &&
  make SrcWorld                                     &&
  install -m 644  LICENSE  /usr/share/$SPELL/doc
 
) > $C_FIFO 2>&1

