(
  [[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

  make configure $OPTS  &&
  make                  &&
  make opt              &&
  prepare_install       &&
  make    install
) > $C_FIFO 2>&1
