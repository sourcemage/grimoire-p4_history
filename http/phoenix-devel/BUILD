(
  make -f client.mk build &&
  prepare_install &&
  make install
) > $C_FIFO 2>&1 && (
  rm $HOME/.mozconfig
)
