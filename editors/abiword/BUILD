# sedit  "s/AM_INIT_AUTOMAKE(AbiSuite,0.99.1)/AM_INIT_AUTOMAKE(AbiSuite,0.99.2)/" \
#        configure.in

(

  cd    abi                   &&                        
  ./autogen.sh                &&
  ./configure  --prefix=/usr  \
               $OPTS          &&
  make                        &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1
