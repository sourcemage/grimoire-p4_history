(

  ln -s makefile.gcc Makefile	&&
  sedit \
"s|/local||;s|^MYCPPFLAGS=|MYCPPFLAGS=$CFLAGS|;s|^MYLDFLAGS=|MYLDFLAGS=$LDFLAGS|" \
	Makefile		&&
  make                   	&&
  prepare_install        	&&
  make    install        

) > $C_FIFO 2>&1
