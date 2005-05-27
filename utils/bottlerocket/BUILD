(

  ./configure  --with-x10port=/dev/firecracker  \
               --prefix=/usr                    \
	       $OPTS				&&
  ln  -sf /dev/$SERIAL /dev/firecracker         &&
  make                                          &&
  prepare_install                               &&
  make    install

) > $C_FIFO 2>&1
