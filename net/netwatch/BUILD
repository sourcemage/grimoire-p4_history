(
  patch -p1 < $SCRIPT_DIRECTORY/netwatch-1.0b.pre3-SGL.patch &&
  
  ./configure	--prefix=/usr		\
		--sysconfdir=/etc	\
		--localstatedir=/var	\
		$OPTS                  &&
  make netwatch                        &&
  prepare_install                      &&
  make    install
  
) > $C_FIFO 2>&1 &&  (

 [  -e  /etc/netwatch.conf  ]  ||  cp netwatch.conf.eg /etc/netwatch.conf

)
