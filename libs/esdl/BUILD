(

  sedit  "s:-L\$(OGLDIR):-L/usr/X11/lib -L\$(OGLDIR):"  c_src/Makefile  &&

  make                                          &&
  prepare_install                               &&
  mkdir  -p  /usr/lib/esdl                      &&
  cp -fRv ebin include priv src /usr/lib/esdl   &&
  cp -f  license.terms /usr/lib/esdl

) > $C_FIFO 2>&1
