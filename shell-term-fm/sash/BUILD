(

  sedit  "s:CFLAGS = -O3 -Wall -Wmissing-prototypes:CFLAGS = $CFLAGS:"  Makefile	&&
  make                           							&&
  
  prepare_install                							&&
  make	install
                    
) > $C_FIFO 2>&1
