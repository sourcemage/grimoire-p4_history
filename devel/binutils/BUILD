(

  mkdir  buildit
  cd     buildit

  ../configure  --host=$BUILD  \
                --prefix=/usr  \
 		$OPTS	       &&
  make                         &&
  prepare_install              &&
  make  install

) > $C_FIFO 2>&1
