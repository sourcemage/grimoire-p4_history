(

  sedit "s~^OPENMOSIX.*~OPENMOSIX = /usr/src/linux~" configuration &&
  make             &&
  prepare_install  &&
  make install     &&
  cp  $SCRIPT_DIRECTORY/openmosix.sh /etc/init.d/ &&
  for  RUNLEVEL  in  3 4 5; do
    ln  -sf  /etc/init.d/openmosix.sh  /etc/rc${RUNLEVEL}.d/S50openmosix
  done
  
  for  RUNLEVEL  in  0 1 2 6; do
    ln  -sf  /etc/init.d/openmosix.sh  /etc/rc${RUNLEVEL}.d/K50openmosix
  done
  
  cp  $SCRIPT_DIRECTORY/openmosix.map  /etc/
  (( i = 1 ))
  for NODE in $NODES; do
    echo "$i	$NODE	1" >> /etc/openmosix.map
    (( i++ ))
  done
    
) > $C_FIFO 2>&1
