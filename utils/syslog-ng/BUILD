(
  
  sedit  "s/-O2/$CFLAGS/"  configure

  ./configure	--build=$BUILD			\
		--prefix=/usr			\
		--sysconfdir=/etc		\
		--localstatedir=/var/run	\
                --sbindir=/sbin                 \
               $OPTS				&&
	       
  make			&&
  prepare_install	&&
  make    install

) > $C_FIFO 2>&1  && 

(


  if  [  !  -f  /etc/syslog-ng/syslog-ng.conf  ];
  then
  
    mkdir  -p /etc/syslog-ng
    case   $CONF_SPECIAL_CONF in
	y|Y|a|A)
	    cp  $SCRIPT_DIRECTORY/syslog-ng.conf  /etc/syslog-ng/syslog-ng.conf
	    ;;
	    
	*)
	    cp  doc/syslog-ng.conf.sample  /etc/syslog-ng/syslog-ng.conf
	    ;;
    esac
    
    chmod  640  /etc/syslog-ng/syslog-ng.conf
    
  fi

)
