(

  patch -p1 < $SCRIPT_DIRECTORY/cinelerra-1.1.6-shared.patch  &&
  sedit 's:ESD_UNIX_SOCKET_DIR ## "/" ## "socket":"/tmp/.esd/socket":'  \
    esound/esd.h

  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
