(

  groupadd  firewire      2>/dev/null
  rm  -f    /dev/raw1394

  default_build			 &&
  . /etc/sysconfig/devices       &&
  if  [[ $DEVICES != "/dev" ]];  then
    make    dev                    &&
    chgrp  firewire  /dev/raw1394  &&
    chmod  660       /dev/raw1394  &&
    message  "`cat  $SCRIPT_DIRECTORY/message.txt`"  
  fi

) > $C_FIFO 2>&1
