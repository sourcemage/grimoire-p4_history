(
  # patch missing dbimon
  patch -p0 -i $SCRIPT_DIRECTORY/DBI-mysql-dbimon.patch &&
  
  perl  Makefile.PL  &&
  make               &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1
