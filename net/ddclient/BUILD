(
  prepare_install                                      &&
  cp  ddclient  /usr/sbin                              &&
  cp  -u  sample-etc_ddclient.conf /etc/ddclient.conf  &&
  mkdir  -p  /usr/doc/ddclient                         &&
  cp  sample-*  /usr/doc/ddclient                      &&
  cp  README  /usr/doc/ddclient
) > $C_FIFO 2>&1  &&

(
  case  $DDCLIENT_BOOT  in
    y|Y|j|J)  cp  $SCRIPT_DIRECTORY/ddclient.sh  /etc/init.d

              ln  -sf  ../init.d/ddclient.sh  /etc/rc0.d/K35ddclient
              ln  -sf  ../init.d/ddclient.sh  /etc/rc6.d/K35ddclient
              ln  -sf  ../init.d/ddclient.sh  /etc/rc1.d/K35ddclient
              ln  -sf  ../init.d/ddclient.sh  /etc/rc2.d/K35ddclient

              ln  -sf  ../init.d/ddclient.sh  /etc/rc3.d/S65ddclient
              ln  -sf  ../init.d/ddclient.sh  /etc/rc4.d/S65ddclient
              ln  -sf  ../init.d/ddclient.sh  /etc/rc5.d/S65ddclient
              ;;
          *)  ;;
  esac

)
