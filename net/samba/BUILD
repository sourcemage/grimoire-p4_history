(

  if  spell_installed  Linux-PAM;  then
    WITH_PAM="--with-pam  --with-pam_smbpass"
  fi

  cd  source  &&

  OPTS="$OPTS --with-smbmount --with-fhs $WITH_PAM"
  default_build  &&

  mkdir  -p  /etc/samba/private
  
) > $C_FIFO 2>&1  &&  (

  if  [  -d  /usr/private  ];  then
    rmdir    /usr/private
    true
  fi

)
