(

  ./configure  --build=${BUILD}                     \
               --prefix=/usr                        \
               --sysconfdir=/etc                    \
               --localstatedir=/var                 &&
  cp $SCRIPT_DIRECTORY/Makefile $SOURCE_DIRECTORY   &&
  make                               &&
  prepare_install                    &&
  make  install

)  >  $C_FIFO  2>&1
