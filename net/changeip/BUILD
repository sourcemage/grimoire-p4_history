(

  chown root.root changeip.conf changeip.sh				&&
  chmod 500 changeip.sh							&&
  chmod 400 changeip.conf						&&

  prepare_install							&&

  if [ -e "/etc/changeip.conf" ]; then					
    CUR_DATE=`date +%y.%m.%d-%H.%M.%S`					&&
    mv /etc/changeip.conf /etc/changeip.conf-$CUR_DATE
  fi									&&
  cp changeip.conf /etc
  cp changeip.sh   /usr/sbin						&&

  sedit "s#ADD_HERE_YOUR_DDNS_INTERFACE#$DDNS_INT#" /etc/changeip.conf 	&&
  sedit "s#YOUR_USER_NAME#$USERNAME#"               /etc/changeip.conf	&&
  sedit "s#YOUR_PASSWORD#$CHANGEIP_PASS#"           /etc/changeip.conf

) > $C_FIFO 2>&1  
