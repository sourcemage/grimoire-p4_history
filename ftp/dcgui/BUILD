(
  sedit 's/include <xmlversion\.h>/include <libxml\/xmlversion\.h>/'  configure  &&

  ./configure  --prefix=/usr      \
               --with-libdc=/usr  &&
  make                            &&
  make  install 

) > $C_FIFO 2>&1
