if [ "$DEVEL" == "no" ] ;then
  patch  -p0  <  $SCRIPT_DIRECTORY/gcc-3.4.patch    
fi                                                  &&
  cd  abi                                           &&

  sedit "s/-pedantic -ansi//g" configure            &&
  OPTS="--enable-threads $OPTS"                     &&
  default_build
