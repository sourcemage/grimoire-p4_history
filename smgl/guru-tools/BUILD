(

  prepare_install                      &&
  rm -rf $SOURCE_DIRECTORY/old.libraries || true
  #prepare install likes to leave $SCRIPT_DIRECTORY/old.libraries around
  #this breaks the cp line below
  chmod 755 $SOURCE_DIRECTORY/*        &&
  cp $SOURCE_DIRECTORY/* /usr/sbin     

) > $C_FIFO 2>&1
