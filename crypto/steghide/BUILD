(

  patch  -p1  <  $SOURCE_CACHE/$SOURCE2
  sedit  "s/\/\$(PACKAGE)-\$(VERSION)/\/\$(PACKAGE)/"  Makefile.in
  
  default_build

) > $C_FIFO 2>&1
