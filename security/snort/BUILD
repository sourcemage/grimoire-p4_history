(
  
 ./configure  --build=${BUILD}				\
	      --prefix=${INSTALL_ROOT}/usr		\
	      --sysconfdir=${INSTALL_ROOT}/etc/snort	\
	      ${CF_OPTS}				\
	      ${OPTS}					&&
 
 make					&&
 make  check				&&

 prepare_install			&&

 make  install

) >  $C_FIFO  2>&1  &&  (

  # Create the dirs
  echo "making directory /etc/snort" 	&&
  mkdir  -p  /etc/snort/rules		&&

  # if there is already an install - use it
  if [ -f /etc/sysconfig/snort ]; then
    . /etc/sysconfig/snort
  else
    LOG_DIR="/var/log/snort"
    IFACES="eth0"
  fi					&&
  			
  echo "making directory ${LOG_DIR}"	&&
  for IFC in ${IFACES}; do
    mkdir  -p  ${LOG_DIR}/${IFC}
  done					&&

  chmod o-rwx ${LOG_DIR} /etc/snort 	&&

  cd etc 				&&
  
  # copy config files
  for  FILE  in  `ls  *conf*`;  do
    if  [  !  -f  /etc/$FILE  ];  then
      echo "installing etc/$FILE to /etc/snort"			&&
      /usr/bin/install -c -m 640  $FILE  /etc/snort
    fi
  done 								&&

  # copy map files
  for  FILE  in  `ls  *.map`;  do
    if  [  !  -f  /etc/$FILE  ];  then
      echo "installing etc/$FILE to /etc/snort"			&&
      /usr/bin/install -c -m 640  $FILE  /etc/snort
    fi
  done 								&&

  cd ../rules 							&&

  for  FILE  in  `ls  *.rules`;  do
    if  [  !  -f  /etc/snort/$FILE  ];  then
      echo "installing rules/$FILE to /etc/snort/rules"		&&
      /usr/bin/install -c -m 640  $FILE   /etc/snort/rules
    fi
  done								&&

 # Modify the conf file
 sedit "s:../rules:/etc/snort/rules:" /etc/snort/snort.conf	&&


 # change owner and group
 chown snort.snort /etc/snort ${LOG_DIR} -R			&&
 # to be sure ..
 chmod 640 /etc/snort/snort.conf				&&

 # create conf for ifaces if any
 for IFC in ${IFACES}; do
    if [ ! -f /etc/snort/snort-${IFC}.conf ]; then
	echo "Creating default /etc/snort/snort-${IFC}.conf"	&&
	cp /etc/snort/snort.conf /etc/snort/snort-${IFC}.conf
    fi
 done
 
)
