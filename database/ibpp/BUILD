(
  sedit "s@/local@@;s/-O3/$CFLAGS/" Makefile	&&
  make IBPP_GCC=1				&&
  prepare_install				&&
  cp release/linux/*.{so,a} /usr/lib/		&&
  cp ibpp.h /usr/include

) > $C_FIFO 2>&1
