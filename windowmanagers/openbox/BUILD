(
# I don't think this is needed anymore but "what do I know?"
  export 	LC_ALL=en_US    &&
  ./configure     --prefix=${INSTALL_ROOT}/usr \
                  $OPTS         &&
  make                          &&
  prepare_install               &&
  make install

) > $C_FIFO 2>&1
