(

  if  spell_installed  Linux-PAM;  then
    WITH_PAM="--with-pam  --with-pam_smbpass"
  fi

  cd  source  &&

  OPTS="$OPTS --with-smbmount --with-fhs $WITH_PAM"
  default_build
  
) > $C_FIFO 2>&1  &&  (

  if  [  -d  /usr/private  ];  then
    rmdir    /usr/private
    true
  fi

)
