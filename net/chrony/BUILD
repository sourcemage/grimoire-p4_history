config_initd ()
{

  cp  $SCRIPT_DIRECTORY/chrony.sh     /etc/init.d/
  if [ ! -f /etc/chrony.conf ]
  then
    cp  $SCRIPT_DIRECTORY/chrony.conf   /etc/
  fi

  case  $Ichrony_BOOT  in
    y|Y|j|J)
      ln  -nsf  ../init.d/chrony.sh  /etc/rc0.d/K10chrony
      ln  -nsf  ../init.d/chrony.sh  /etc/rc1.d/K10chrony
      ln  -nsf  ../init.d/chrony.sh  /etc/rc2.d/K10chrony
      ln  -nsf  ../init.d/chrony.sh  /etc/rc6.d/K10chrony

      ln  -nsf  ../init.d/chrony.sh  /etc/rc3.d/S90chrony
      ln  -nsf  ../init.d/chrony.sh  /etc/rc4.d/S90chrony
      ln  -nsf  ../init.d/chrony.sh  /etc/rc5.d/S90chrony
      ;;
    *)  true
      ;;
  esac

}

(

  ./configure                  \
    --prefix=/usr              \
    $OPTS                      &&
  make                         &&
  make docs                    &&
  prepare_install              &&
  make    install              &&
  make install-docs            &&

  config_initd


) > $C_FIFO 2>&1
