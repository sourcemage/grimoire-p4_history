(

  patch -p1 < $SCRIPT_DIRECTORY/watchdog-gcc3.patch	&&

  default_build                  &&

  mkdir -p      /usr/doc/$SPELL  &&
  cp examples/* /usr/doc/$SPELL

) > $C_FIFO 2>&1  
