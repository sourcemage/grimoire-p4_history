(

  sedit "s|-O3|$CFLAGS|" configure &&

  ./configure     \
    --prefix=/usr \
    $OPTS         &&
  make            &&
  prepare_install &&
  make    install

) >$C_FIFO 2>&1
