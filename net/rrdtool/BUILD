(

  sedit  's/ \$(PMP.*//'  doc/Makefile.in  &&
  sedit  's/ install-data-am/ install-imanDATA/'  doc/Makefile.in  &&
  sedit  's/ install-data-am//'  examples/Makefile.in  &&
  sedit  's/ install-data-am//'  contrib/Makefile.in  &&
  sedit  's/ install-data-am//'  contrib/trytime/Makefile.in  &&
  sedit  's/ install-data-am//'  Makefile.in  &&

  default_build  &&
  make  site-perl-install

) > $C_FIFO 2>&1
