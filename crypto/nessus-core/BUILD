(

  sedit  "s/\$localstatedir\/nessus\/CA/\/etc\/ssl\/nessus\/private/"  nessus-mkcert.in 
  sedit  "s/\$sharedstatedir\/nessus\/CA/\/etc\/ssl\/nessus\/certs/"   nessus-mkcert.in 

  default_build

) > $C_FIFO 2>&1

(

  case $NESSUSD_BOOT in
          y|Y|j|J) installscript nessusd.sh
                   ;;
                *) true
                   ;;
  esac

)
