(

  sedit "s/^LDFLAGS.*/& ${LDFLAGS}/"  Make/makedefs  &&

  make  OPTF="\"$CFLAGS\""                           &&
  prepare_install                                    &&
  make  INST_LOCATION=${INSTALL_ROOT}/usr  install

) > $C_FIFO 2>&1
