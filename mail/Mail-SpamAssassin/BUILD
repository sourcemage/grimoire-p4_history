(

  perl  Makefile.PL  		&&
  make               		&&
  prepare_install    		&&
  MAKE_NJOBS_OLD=$MAKE_NJOBS	&&
  MAKE_NJOBS=1			&&
  make    install		
  MAKE_NJOBS=$MAKE_NJOBS_OLD

) > $C_FIFO 2>&1
