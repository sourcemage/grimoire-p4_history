(

  patch  -p0  <  $SCRIPT_DIRECTORY/secadv_20030317.txt             &&
  patch  -p0  ssl/s3_srvr.c $SCRIPT_DIRECTORY/secadv_20030319.txt  &&


  ./config  --prefix=/usr                       \
            --openssldir=/etc/ssl               \
            shared threads                      &&

  sedit  "s/-O3//"                    Makefile  &&
  sedit  "s/^CFLAG=/CFLAG=$CFLAGS /"  Makefile  &&

  make                                          &&
  prepare_install                               && 
  make  MANDIR=/usr/share/man  install

) > $C_FIFO 2>&1
