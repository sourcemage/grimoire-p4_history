  cp  -fv  $SCRIPT_DIRECTORY/Makefile     $SOURCE_DIRECTORY               &&
  cp  -fv  $SCRIPT_DIRECTORY/srcMakefile  $SOURCE_DIRECTORY/src/Makefile  &&
  sedit "s:/usr/bin:${INSTALL_ROOT}/usr/bin:" $SOURCE_DIRECTORY/src/Makefile &&

  make
