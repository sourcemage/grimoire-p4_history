(

  I_DIR=/usr/share/${SPELL}  &&
  prepare_install            &&
  mkdir  -p  ${I_DIR}        &&
  cp  meld  *.py  ${I_DIR}   &&
  cp  -r  glade2  ${I_DIR}   &&
  cp  -r  manual  ${I_DIR}   &&
  install  -m755  ${SCRIPT_DIRECTORY}/meld  /usr/bin

)  >  ${C_FIFO}  2>&1
