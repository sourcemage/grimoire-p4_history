(
  # Implement official perl change 17844: 
  #	#17836 (DB_File-1.805) misses a couple of dTHX declarations
  #
  patch -p1 < $SCRIPT_DIRECTORY/DB_File.xs.patch &&

  perl Makefile.PL &&
  make             &&
  prepare_install  &&
  make install
) > $C_FIFO 2>&1
