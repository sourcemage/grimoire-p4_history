(

  message "${MESSAGE_COLOR}Scilab (c)INRIA-ENPC ${DEFAULT_COLOR}"	&&

  ./configure  --build=${BUILD}      					\
               --prefix=/usr         					\
               --sysconfdir=/etc     					\
               --localstatedir=/var  					\
               ${OPTS}               					&&
  make 	  all                       					&&
  prepare_install                    					&&
  make    install

) > ${C_FIFO} 2>&1
