(

  ./configure  --prefix=/usr  &&
  make                        &&
  prepare_install             &&
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


  case  $INETD_BOOT  in
    y|Y|j|J)  [  -f  /etc/init.d/inetd.sh  ]  ||
              cp  $SCRIPT_DIRECTORY/inetd.sh  /etc/init.d
              ln  -sf  ../init.d/inetd.sh  /etc/rc0.d/K60inetd
              ln  -sf  ../init.d/inetd.sh  /etc/rc1.d/K60inetd
              ln  -sf  ../init.d/inetd.sh  /etc/rc2.d/K60inetd
              ln  -sf  ../init.d/inetd.sh  /etc/rc6.d/K60inetd

              ln  -sf  ../init.d/inetd.sh  /etc/rc3.d/S40inetd
              ln  -sf  ../init.d/inetd.sh  /etc/rc4.d/S40inetd
              ln  -sf  ../init.d/inetd.sh  /etc/rc5.d/S40inetd  ;;
          *)  true  ;;
  esac

)
