  patch  Makefile  $SCRIPT_DIRECTORY/Makefile.patch  &&


  sedit "s:prefix =:prefix = ${INSTALL_ROOT}:" Makefile &&
  IR=`echo $INSTALL_ROOT | sed 's/\\//\\\\\\//g'`
  sed "s/^exec_prefix.*$/exec_prefix = $IR/" -i Makefile &&

  make USE_LOG=false DEBUG=false
