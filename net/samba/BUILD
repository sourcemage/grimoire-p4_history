(

  pushd  source  &&
  ./configure  \
    --prefix=/usr  \
    --sysconfdir=/etc  \
    --localstatedir=/var  \
    --with-swatdir=/usr/share/swat  \
    --with-smbmount  \
    --with-fhs  \
    --with-automount  \
    --with-smbmount  \
    --with-syslog  \
    --with-winbind  \
    $OPTS  &&
  make  &&
  prepare_install  &&
  make  install  &&
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
