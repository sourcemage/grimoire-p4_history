fags_boot_install () {

  # add own user & dirs
  mkdir  -p             /var/spool/fags/download
  groupadd  fags                              2>/dev/null
  useradd  -g fags  -d /var/spool/fags  fags  2>/dev/null
  chown  -R  fags.fags  /var/spool/fags

  # create config dir and move it /etc/fags
  if [ ! -d /etc/fags ];  then
    rm  -rf  /etc/fags
    rm  -rf  /var/spool/fags/.fags
    su  fags  -c "fags" # create default cfg
    sedit  "s:/pub/music/:/var/spool/fags/:"  /var/spool/fags/.fags/config
    mv  /var/spool/fags/.fags  /etc/fags
    ln  -sf  /etc/fags  /var/spool/fags/.fags
    chown  root.fags  /etc/fags/config
    chmod  0640       /etc/fags/config
  fi

  # install init script
  cp  $SCRIPT_DIRECTORY/fags.sh  /etc/init.d

  ln  -sf  ../init.d/fags.sh  /etc/rc0.d/K00fags
  ln  -sf  ../init.d/fags.sh  /etc/rc6.d/K00fags

  ln  -sf  ../init.d/fags.sh  /etc/rc3.d/S99fags
  ln  -sf  ../init.d/fags.sh  /etc/rc4.d/S99fags
  ln  -sf  ../init.d/fags.sh  /etc/rc5.d/S99fags
}

(
  sedit  "s:-O2:$CFLAGS:"  Makefile.in

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install		     &&
  (
    case  $FAGS_BOOT  in
      y|Y|j|J)  fags_boot_install
                ;;
            *)  ;;
    esac
  )
) > $C_FIFO 2>&1
