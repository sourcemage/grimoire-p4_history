(

  patch  -p1  <  $SCRIPT_DIRECTORY/esdl.patch
  make                                          &&
  prepare_install                               &&
  mkdir /usr/lib/esdl                           &&
  cp -Rv ebin include priv src /usr/lib/esdl    &&
  cp license.terms /usr/lib/esdl             

) > $C_FIFO 2>&1
