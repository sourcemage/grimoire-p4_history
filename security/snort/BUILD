(

  create_account  snort  &&

  [[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

  OPTS="--prefix=${INSTALL_ROOT}/usr  \
    --sysconfdir=${INSTALL_ROOT}/etc/snort  \
 --localstatedir=${INSTALL_ROOT}/var  \
        --mandir=${INSTALL_ROOT}/usr/share/man   \
       --infodir=${INSTALL_ROOT}/usr/share/info  \
                 ${OPTS}"

  [     "$CF_SNMP" = y  ]  &&  OPTS="$OPTS --with-snmp"
  [      "$CF_SMB" = y  ]  &&  OPTS="$OPTS --enable-smbalerts"
  [    "$CF_FLEXR" = y  ]  &&  OPTS="$OPTS --enable-flexresp"
  [  "$CF_PERFMON" = y  ]  &&  OPTS="$OPTS --enable-perfmonitor"
  [    "$CF_MYSQL" = y  ]  &&  OPTS="$OPTS --with-mysql"
  [     "$CF_PSQL" = y  ]  &&  OPTS="$OPTS --with-postgresql"
  [      "$CF_ORA" = y  ]  &&  OPTS="$OPTS --with-oracle"
  [     "$CF_ODBC" = y  ]  &&  OPTS="$OPTS --with-odbc"

  ./configure  $OPTS  &&
  make  &&
  make  check  &&
  prepare_install  &&
  make  install

) > $C_FIFO 2>&1 && (

  # Create the dirs
  echo "Making directory /etc/snort..."  &&
  mkdir  -p  /etc/snort/rules &&

  echo "Making directory /var/log/snort..."  &&
  mkdir  -p  /var/log/snort  &&

  chmod o-rwx /var/log/snort /etc/snort &&

  cd  etc  &&
  
  # copy config files
  for  FILE  in  *conf* unicode.map  ;  do
    if  [  !  -f  /etc/$FILE  ]  ;  then
      echo "Installing etc/$FILE to /etc/snort..."  &&
      install  -m 640  $FILE  /etc/snort
    fi
  done  &&

  cd  ../rules  &&

  for  FILE  in  *.rules  ;  do
    if  [  !  -f  /etc/snort/$FILE  ]  ;  then
      echo "Installing rules/$FILE to /etc/snort/rules..."  &&
      install  -m 640  $FILE   /etc/snort/rules
    fi
  done  &&

 # Modify the conf file
 sedit  "s:../rules:/etc/snort/rules:"  /etc/snort/snort.conf  &&

 # change owner and group
 chown  -R  snort.snort  /etc/snort  /var/log/snort  &&
 # to be sure ..
 chmod  640  /etc/snort/snort.conf
 
)
