(

  patch  -p0  -d  lib/Razor2  \
  <  ${SCRIPT_DIRECTORY}/Razor2.patch  &&

  perl  Makefile.PL  &&
  make               &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1
