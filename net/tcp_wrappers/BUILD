(

  patch  -p 1  <  $SCRIPT_DIRECTORY/tcp_wrappers.patch

  make  REAL_DAEMON_DIR=/usr/sbin linux  &&
  prepare_install                        &&
  for  EXECUTABLE in *; do
    if  [  -x  $EXECUTABLE ];  then
      cp       $EXECUTABLE  /usr/sbin
    fi
  done                                   &&
  cp  tcpd.h     /usr/include            &&
  cp  libwrap.a  /usr/lib                &&

  # Copy man pages
  for i in $( seq 1 8 ) ; do
    install -m 644 *.$i /usr/man/man$i > /dev/null 2>&1
  done

) > $C_FIFO 2>&1
