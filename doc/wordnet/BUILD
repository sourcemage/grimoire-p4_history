(

  patch -p1 < $SCRIPT_DIRECTORY/wordnet-1.7.config  &&

  prepare_install                                   &&

  mkdir  -p  /usr/doc/$SPELL                        &&

  make SrcWorld                                     &&
  install -m 644  LICENSE  /usr/doc/$SPELL
 
) > $C_FIFO 2>&1

