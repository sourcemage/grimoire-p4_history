(

  patch  -p1  <  $SCRIPT_DIRECTORY/esdl.patch   &&
  make                                          &&
  prepare_install                               &&
  mkdir  -p  /usr/lib/esdl                      &&
  cp -fRv ebin include priv src /usr/lib/esdl   &&
  cp -f  license.terms /usr/lib/esdl

) > $C_FIFO 2>&1
