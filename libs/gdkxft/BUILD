(

  export  CFLAGS="`freetype-config --cflags` $CFLAGS -I/usr/include/libcapplet1" &&
  default_build                         &&
  mkdir  -p  /etc/X11/xinit/xinitrc.d  &&
  gdkxft_sysinstall

) > $C_FIFO 2>&1
