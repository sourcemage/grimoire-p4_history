(

  sedit "s/^LDFLAGS.*/& ${LDFLAGS}/"  Make/makedefs  &&
  sedit "s/-O2/\"$CFLAGS\"/"  Make/makedefs          &&
  for i in $(grep -rl YieldCurrentThread .)
   do sedit "s/YieldCurrentThread/CurrentThread/" $i
  done                                               &&
  make                                               &&
  prepare_install                                    &&
  make  INST_LOCATION=${INSTALL_ROOT}/usr  install

) > $C_FIFO 2>&1
