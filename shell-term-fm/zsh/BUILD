(

  OPTS="$OPTS  --bindir=/bin  --disable-lfs  --enable-function-subdirs"
  default_build  &&

  ## install configuration files. ##
  if  [  !  -f  /etc/zshenv  ]  ;  then
    install  -m 644  $SCRIPT_DIRECTORY/zshenv  /etc
  fi  &&
  if  [  !  -f  /etc/zshrc  ]  ;  then
    install  -m 644  $SCRIPT_DIRECTORY/zshrc  /etc
  fi

)  >  $C_FIFO  2>&1
