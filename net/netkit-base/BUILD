(

  ./configure  --prefix=/usr  $OPTS	&&
  make                        		&&
  prepare_install             		&&
  make    install

) > $C_FIFO 2>&1  &&

(

  cd  etc.sample
  for	FILE  in  `ls`;  do
    if    [  !  -e  /etc/$FILE      ]  &&
          [  "$FILE"  !=  "README"  ]
    then  cp  $FILE  /etc
    fi
  done

)
