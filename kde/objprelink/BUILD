(
  gcc -o objprelink -O2 objprelink.c /usr/lib/libbfd.a /usr/lib/libiberty.a &&
  prepare_install                   &&
  cp objprelink /usr/bin/
) > $C_FIFO 2>&1
