default_build  &&  (

  case  $YPBIND_BOOT  in
    y|Y|j|J)  cp  $SCRIPT_DIRECTORY/ypbind.sh  /etc/init.d

              ln  -sf  ../init.d/ypbind.sh  /etc/rc0.d/K60ypbind
              ln  -sf  ../init.d/ypbind.sh  /etc/rc1.d/K60ypbind
              ln  -sf  ../init.d/ypbind.sh  /etc/rc2.d/K60ypbind
              ln  -sf  ../init.d/ypbind.sh  /etc/rc6.d/K60ypbind

              ln  -sf  ../init.d/ypbind.sh  /etc/rc3.d/S40ypbind
              ln  -sf  ../init.d/ypbind.sh  /etc/rc4.d/S40ypbind
              ln  -sf  ../init.d/ypbind.sh  /etc/rc5.d/S40ypbind
              ;;
          *)  true
              ;;
  esac

)
