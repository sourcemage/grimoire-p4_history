(

  cd  etc.sample                        &&

  prepare_install                       &&

  for  FILE  in  *  ;  do
    if  [  !  -e  /etc/$FILE  -a  "$FILE"  !=  "README"  ]  ;  then
      install  -v  -m 644  $FILE  /etc
    fi
  done

) > $C_FIFO 2>&1 
