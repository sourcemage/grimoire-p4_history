(

  sedit "s~^OPENMOSIX.*~OPENMOSIX = /usr/src/linux~" configuration &&
  make             &&
  prepare_install  &&
  make install     &&
  installscript  openmosix.sh &&

  cp  $SCRIPT_DIRECTORY/openmosix.map  /etc/
  (( i = 1 ))
  for NODE in $NODES; do
    echo "$i	$NODE	1" >> /etc/openmosix.map
    (( i++ ))
  done
    
) > $C_FIFO 2>&1
