(

  OPTS="$OPTS --with-smbmount --with-fhs"

  if  [  $WITH_LIBSMBCLIENT = "y"  ]  ;  then
    OPTS="$OPTS --with-libsmbclient"
  fi  &&

  pushd  source                                 &&
  default_build                                 &&
  if  [  $WITH_LIBSMBCLIENT = "y"  ]  ;  then
    install  -m 755  bin/libsmbclient.so  /usr/lib  &&
    install  -m 644  bin/libsmbclient.a  /usr/lib   &&
    install  -m 644  include/libsmbclient.h  /usr/include
  fi                                            &&
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
