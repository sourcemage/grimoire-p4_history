(

  make                               &&
  prepare_install                    &&
  make    install 
  

) > $C_FIFO 2>&1 && (

  if  [ ! -e /etc/vsftpd.conf ]
  then  cp $SCRIPT_DIRECTORY/vsftpd.conf /etc
  cat "secure_chroot_dir=/var/empty" >> /etc/vsftpd.conf
  fi
)
