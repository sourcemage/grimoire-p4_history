(

  OPTS="$OPTS --with-smbmount --with-fhs"

  pushd  source                                 &&
  default_build                                 &&
  popd                                          &&

  mkdir  -p  /usr/share/samba/codepages         &&
  mkdir  -p  /var/{spool,cache,log}/samba       &&

  mkdir  -m 700  -p  /etc/samba/private         &&

  if  [  !  -f  /etc/samba/private/smbpasswd  ]  ;  then
    touch  /etc/samba/private/smbpasswd
    chmod  600  /etc/samba/private/smbpasswd
  fi                                            &&

  cp  -f  examples/smb.conf.default /etc/samba  &&

  mkdir  -p  /usr/doc/samba                     &&
  cp  -fa  Manifest  Read-Manifest-Now  Roadmap \
    WHATSNEW.txt  examples  /usr/doc/samba/     &&

  rmdir  --ignore-fail-on-non-empty  /usr/private

) > $C_FIFO 2>&1
