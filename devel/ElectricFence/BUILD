(

  patch  -p1  <  $SCRIPT_DIRECTORY/ElectricFence-2.1.patch  &&

  if [[ $CC ]]; then
	  sedit  "s:CC= cc:CC= $CC:"  $SOURCE_DIRECTORY/Makefile
  fi
  sedit  "s:CFLAGS= -g:CFLAGS= -g $CFLAGS:"  $SOURCE_DIRECTORY/Makefile  &&
  
  make 	           &&
  prepare_install
  make install

) > $C_FIFO 2>&1
