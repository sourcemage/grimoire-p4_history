(

  groupadd  firewire      2>/dev/null
  rm  -f    /dev/raw1394

  if [[ $(installed_version gcc) == 3.3 ]]; then
    cd $SOURCE_DIRECTORY/src
    patch -p0 < $SCRIPT_DIRECTORY/test.diff
    cd $SOURCE_DIRECTORY
  fi

  ./configure  --prefix=/usr     &&
  make                           &&
  prepare_install                &&
  make    install                &&
  make    dev                    &&
  chgrp  firewire  /dev/raw1394	 &&
  chmod  660       /dev/raw1394  &&
  message  "`cat  $SCRIPT_DIRECTORY/message.txt`"  

) > $C_FIFO 2>&1
