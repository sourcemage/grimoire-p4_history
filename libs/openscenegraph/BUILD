(
  sedit  "s/gmake/make/"  Make/instexamplesrc  &&
  sedit "s/-O2/\"$CFLAGS\"/"  Make/makedefs    &&
   for i in $(grep -rl YieldCurrentThread .)
   do sedit "s/YieldCurrentThread/CurrentThread/" $i
  done                                         &&
  make opt GIF_LIBS="-lungif"    &&
  prepare_install                              &&
  make  INST_LOCATION=${INSTALL_ROOT}/usr  INST_EXAMPLES=${INSTALL_ROOT}/usr/bin install

) > $C_FIFO 2>&1
