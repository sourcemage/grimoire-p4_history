fags_boot_install () {

  # add own user & dirs
  mkdir  -p             /var/spool/fags/download
  groupadd  fags                              2>/dev/null
  useradd  -g fags  -d /var/spool/fags  fags  2>/dev/null
  chown  -R  fags.fags  /var/spool/fags

  # create config file and move it /etc/fags.conf
  if [ ! -f /etc/fags.conf ];  then
    rm  -f  /var/spool/fags/.fags/config
    su  fags  -c "fags" # create default cfg
    sedit  "s:/pub/music/:/var/spool/fags/:"  /var/spool/fags/.fags/config
    mv  /var/spool/fags/.fags/config  /etc/fags.conf
    ln  -sf  /etc/fags.conf  /var/spool/fags/.fags/config
    chown  root.fags  /etc/fags.conf
    chmod  0640       /etc/fags.conf
  fi

  # install init script
  cp  $SCRIPT_DIRECTORY/fags.sh  /etc/init.d

  ln  -sf  ../init.d/fags.sh  /etc/rc0.d/K00fags
  ln  -sf  ../init.d/fags.sh  /etc/rc6.d/K00fags

  ln  -sf  ../init.d/fags.sh  /etc/rc3.d/S99fags
  ln  -sf  ../init.d/fags.sh  /etc/rc4.d/S99fags
  ln  -sf  ../init.d/fags.sh  /etc/rc5.d/S99fags
}

sedit  "s:-O2:$CFLAGS:"  Makefile.in  &&
default_build                         &&
(
  case  $FAGS_BOOT  in
    y|Y|j|J)  fags_boot_install
              ;;
          *)  ;;
  esac
)
