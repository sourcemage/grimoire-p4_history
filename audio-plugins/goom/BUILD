(
  patch -p0<$SCRIPT_DIRECTORY/goom.patch &&
  ./configure   --prefix=/usr \
		$OPTS 	      &&
  make                        &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1
