(

  groupadd  firewire      2>/dev/null
  rm  -f    /dev/raw1394

  ./configure  --prefix=/usr     &&
  make                           &&
  prepare_install                &&
  make    install                &&
  make    dev                    &&
  chgrp  firewire  /dev/raw1394	 &&
  chmod  660       /dev/raw1394  &&
  message  "`cat  $SCRIPT_DIRECTORY/message.txt`"  

) > $C_FIFO 2>&1
