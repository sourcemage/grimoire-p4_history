(

  ./configure  --build=${BUILD}  \
               --prefix=/usr     \
               --bindir=/bin     \
               ${OPTS}           &&
  make                           &&
  prepare_install                &&
  make    install                &&
  rm  -f         /bin/awk        &&
  ln  -sf  gawk  /bin/awk

) > ${C_FIFO} 2>&1
