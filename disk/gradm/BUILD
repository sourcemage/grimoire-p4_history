(

  patch  -p1  <  ${SCRIPT_DIRECTORY}/passwdprompt.patch  &&

  make             &&
  prepare_install  &&
  make    install  &&

  message  "${MESSAGE_COLOR}\nRun '/sbin/gradm -P' to configure gradm passwords.${DEFAULT_COLOR}\n"

) > $C_FIFO 2>&1
