(

  patch  Makefile  <  $SCRIPT_DIRECTORY/Makefile.diff  &&
  patch  noip2.c   <  $SCRIPT_DIRECTORY/noip2.c.diff   &&

  make             &&
  prepare_install  &&
  install  -m 500  -o root  -g root  noip2  /usr/sbin/  &&
  track_manual  /etc/NO-IP*

) > $C_FIFO 2>&1
