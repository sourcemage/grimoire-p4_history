(

  OPTS="$OPTS --with-swatdir=/usr/share/swat --with-smbmount --with-fhs \
      --with-automount --with-winbind --with-libsmbclient"

  patch  -p0  <  $SCRIPT_DIRECTORY/krb5config.patch  &&
  pushd  source  &&
  default_build  &&
  popd

) >$C_FIFO 2>&1 && (

  mkdir  -p  /usr/share/samba/codepages    &&
  mkdir  -p  /var/{spool,cache,log}/samba  &&

  mkdir  -m 700  -p  /etc/samba/private  &&
  if  [  !  -f  /etc/samba/private/smbpasswd  ];  then
    touch       /etc/samba/private/smbpasswd  &&
    chmod  600  /etc/samba/private/smbpasswd
  fi  &&

  cp  -f  examples/smb.conf.default  /etc/samba/  &&
  if                       [  !  -f  /etc/samba/smb.conf  ];  then
    cp  /etc/samba/smb.conf.default  /etc/samba/smb.conf
  fi

)
