(

# fix bug in 1.7.4 config script
#  sedit "s/-Wbad-function-cast//" 
  patch -p0 < $SPELL_DIRECTORY/cf.diff configure.in	&&
  aclocal				&&
  automake				&&
  autoconf				&&

  ./configure	--prefix=/usr \
		--with-qhacc-config=/usr/qhacc \
		$OPTS 			&&
  make                   		&&
  prepare_install        		&&
  make    install        

) > $C_FIFO 2>&1
