(

  patch include/sundries.h < $SCRIPT_DIRECTORY/sundries.h.diff	&&

  default_build                  &&

  mkdir -p      /usr/doc/$SPELL  &&
  cp examples/* /usr/doc/$SPELL  &&

) > $C_FIFO 2>&1  
