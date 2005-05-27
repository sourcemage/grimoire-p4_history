(

  sedit  's!=rpcgen!=rpcgen -Y /usr/bin!'  rpc.bootparamd/Makefile  &&

  ./configure  --prefix=/usr  $OPTS	&&
  make                        		&&
  prepare_install             		&&
  make    install

) > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIRECTORY/bootparams.5.gz  /usr/man/man5

  if    [  !  -f  /etc/bootparams  ]
  then  cp  $SCRIPT_DIRECTORY/bootparams /etc
  fi

)
