(

  I_DIR=/usr/share/${SPELL}                           &&
  prepare_install                                     &&
  install  -d  -m  755  -o  root  -g  root  ${I_DIR}  &&
  install  -m  644  -o  root  -g  root  *  ${I_DIR}   &&
  install  -m  755  -o  root  -g  root                \
    ${SCRIPT_DIRECTORY}/banshee_create  /usr/sbin

)  >  ${C_FIFO}  2>&1
