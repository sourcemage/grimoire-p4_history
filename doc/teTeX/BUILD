(

  OPTS="$OPTS --disable-multiplatform"  
  rm -rf utils/dialog                   &&
  rm -rf utils/texinfo                  &&
  #stupid makefile strips binaries it knows about, whether it installed them or not!
  for i in info infokey install-info makeinfo texindex;
   do sedit  "s/ $i//g" Makefile.in
  done                                  &&
  default_build

) > $C_FIFO 2>&1
