(

  cd gnu					&&

  autoconf					&&
  ./configure 	--prefix=/usr 			\
		--localstatedir=/var		&&
		
  cd ..						&&
  make -f makefile.gnu prepare			&&
  make -f makefile.gnu				&&

  prepare_install                               &&
 
  cp linux-gnu/en/rs/arj/arj /usr/bin		&&
  cp linux-gnu/en/rs/arjdisp/arjdisp /usr/bin   &&
  cp linux-gnu/en/rs/rearj/rearj /usr/bin	&&
  cp linux-gnu/en/rs/register/register /usr/bin &&
  cp linux-gnu/en/rs/arjcrypt/arjcrypt.so /usr/lib &&
  cp linux-gnu/en/rs/arjsfx/arjsfx /usr/bin	

) > $C_FIFO 2>&1  
