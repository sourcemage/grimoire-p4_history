(
  # Do not prompt for password, let the user setting it later
  patch  -p1  <  ${SCRIPT_DIRECTORY}/passwdprompt.patch  &&
  make
) > $C_FIFO 2>&1
