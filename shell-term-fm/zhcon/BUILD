(

  patch  -p0  <  ${SCRIPT_DIRECTORY}/zhcon-smglcompat.patch  &&
  patch  -p0  <  ${SCRIPT_DIRECTORY}/gcc-3.3.patch           &&

  ./configure  --prefix=/usr  &&
  make                        &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1
