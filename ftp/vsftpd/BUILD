(
  patch -p0 <$SPELL_DIRECTORY/mk.diff 	&&

  make                               &&
  prepare_install                    &&
  make    install 
  

) > $C_FIFO 2>&1 && (

  if  [ ! -e /etc/vsftpd.conf ]
  then  cp $SPELL_DIRECTORY/vsftpd.conf /etc
  /bin/echo "secure_chroot_dir=/var/empty" >> /etc/vsftpd.conf
  fi

  if [ ! -d /var/empty ]
  then mkdir /var/empty
  fi
)
