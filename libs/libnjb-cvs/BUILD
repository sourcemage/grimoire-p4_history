(
  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
	       --with-owner=root:audio   \
               --with-perms=a+w	     \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                  
 
) > $C_FIFO 2>&1
