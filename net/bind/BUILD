(

  groupadd  bind            2>/dev/null
  useradd   bind  -g  bind  2>/dev/null

  ./configure  --prefix=/usr           \
               --sysconfdir=/etc/bind  \
               --localstatedir=/var    &&
  make                                 &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1  &&

( 

  mkdir  -p                   /usr/doc/bind
  cp  $SOURCE_CACHE/$SOURCE2  /usr/doc/bind

  # Install man pages.

  for  DIRECTORY in doc/man/*;  do
    for  (( COUNT=1 ; COUNT < 9 ; COUNT++ )); do
      cp  $DIRECTORY/*.$COUNT  /usr/man/man$COUNT  2> /dev/null
    done
  done

  SNC="$SCRIPT_DIRECTORY/named.conf"
  SNR="$SCRIPT_DIRECTORY/named.root"
  RES="$SCRIPT_DIRECTORY/resolv.conf"

  [  -d  /etc/bind             ]  ||  mkdir     /etc/bind
  [  -e  /etc/bind/named.conf  ]  ||  cp  $SNC  /etc/bind
  [  -e  /etc/bind/named.root  ]  ||  cp  $SNR  /etc/bind
  [  -e  /etc/resolv.conf      ]  ||  cp  $RES  /etc
  [  -e  /etc/bind/rndc.key    ]  ||  rndc-confgen  -a

  chown  -R  bind:bind  /etc/bind

  case  $BIND_BOOT  in
    y|Y|j|J)  cp  $SCRIPT_DIRECTORY/named.sh  /etc/init.d

              ln  -sf  ../init.d/named.sh  /etc/rc0.d/K50named
              ln  -sf  ../init.d/named.sh  /etc/rc6.d/K50named

              ln  -sf  ../init.d/named.sh  /etc/rc1.d/S35named
              ln  -sf  ../init.d/named.sh  /etc/rc2.d/S35named
              ln  -sf  ../init.d/named.sh  /etc/rc3.d/S35named
              ln  -sf  ../init.d/named.sh  /etc/rc4.d/S35named
              ln  -sf  ../init.d/named.sh  /etc/rc5.d/S35named
              ;;
          *)  ;;
  esac

)
