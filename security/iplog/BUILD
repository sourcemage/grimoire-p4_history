(
  
 ./configure  --build=${BUILD}				\
	      --prefix=${INSTALL_ROOT}/usr		\
	      --sysconfdir=${INSTALL_ROOT}/etc		\
	      --localstatedir=${INSTALL_ROOT}/var	\
	      ${OPTS}					&&
 
 make							&&

 prepare_install					&&

 make  install

) >  $C_FIFO  2>&1  &&  (

 touch  /var/log/iplog							&&
 
 # copy config file
 if  [  !  -f  /etc/iplog.conf  ];  then
      echo installing example-iplog.conf to /etc/iplog.conf		&&
      /usr/bin/install -c -m 640  example-iplog.conf  /etc/iplog.conf
 fi									&&

 # Modify the conf file
 sedit "s:group nogroup:group iplog:" /etc/iplog.conf			&&

 # change owner and group
 chown iplog.iplog /etc/iplog.conf /var/log/iplog			&&
 
 # to be sure ..
 chmod 640 /etc/iplog.conf  /var/log/iplog
 
)
