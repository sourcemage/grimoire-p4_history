(
  sedit  "s/gmake/make/"  Make/instexamplesrc  &&


  make  OPTF="\"$CFLAGS\""  GIF_LIBS="-lungif"  &&
  prepare_install  &&
  make  INST_SYS_PREFIX=/usr  install

) > $C_FIFO 2>&1
