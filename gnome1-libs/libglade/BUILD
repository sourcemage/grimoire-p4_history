(
  xhost +localhost
  export DISPLAY=:0.0

  ./configure  --prefix=${INSTALL_ROOT}/usr  \
               --disable-gnomedb             \
	       $OPTS		             &&
  make                                       &&
  prepare_install                            &&
  make    install

) > $C_FIFO 2>&1
