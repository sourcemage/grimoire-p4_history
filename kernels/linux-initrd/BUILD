if [ "$FILE_SYSTEM" == "y" ] ; then
  export BUILD_DIRECTORY
  export INSTALL_ROOT
  message "${MESSAGE_COLOR}Entering ${MKINITRD_SCRIPT}${DEFAULT_COLOR}" &&
  sh ${SCRIPT_DIRECTORY}/${MKINITRD_SCRIPT} ${KVERSION} &&
  message "${MESSAGE_COLOR}Done with ${MKINITRD_SCRIPT}${DEFAULT_COLOR}" &&
  if [ "$EDIT_LINUXRC" == "y" ] ; then
    $EDITOR ${BUILD_DIRECTORY}/initrd/linuxrc
  fi 
fi
