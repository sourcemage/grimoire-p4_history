(

  patch  <  $SCRIPT_DIRECTORY/drac.patch  &&
  make                                    &&
  prepare_install                         &&
  make    install                         &&
  make    install-man                     &&
  mkdir  -p      /etc/mail                &&
  mkdir  -p      /usr/include/drac        &&
  cp  drac.h     /usr/include/drac        &&
  cp  libdrac.a  /usr/lib

) > $C_FIFO 2>&1  &&

(

  cp  $SCRIPT_DIRECTORY/dracd.sh  /etc/init.d

  case  $DRAC_BOOT  in

     y|Y|j|J)  ln     -sf  ../init.d/dracd.sh  /etc/rc0.d/K10dracd
               ln     -sf  ../init.d/dracd.sh  /etc/rc1.d/K10dracd
               ln     -sf  ../init.d/dracd.sh  /etc/rc2.d/K10dracd
               ln     -sf  ../init.d/dracd.sh  /etc/rc6.d/K10dracd

               ln     -sf  ../init.d/dracd.sh  /etc/rc3.d/S99dracd
               ln     -sf  ../init.d/dracd.sh  /etc/rc4.d/S99dracd
               ln     -sf  ../init.d/dracd.sh  /etc/rc5.d/S99dracd

               ;;
           *)  true
               ;;
  esac
  
  if  [  -f  /etc/mail/dracd.allow  ];  then
    cp  $SCRIPT_DIRECTORY/dracd.allow  /etc/mail
  fi

)
