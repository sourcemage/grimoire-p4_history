(

  patch -p0 < $SCRIPT_DIRECTORY/islpci.patch				&&
#  patch -p0 < $SCRIPT_DIRECTORY/isl_ioctl.diff				&&

  make modules		&&
  prepare_install	&&
  make install		&&

  mkdir -p /var/lib/hotplug/firmware				&&
  cp ${SOURCE_CACHE}/${SOURCE2} /var/lib/hotplug/firmware	&&
  cp $SCRIPT_DIRECTORY/firmware.agent /etc/hotplug/		&&

  depmod -ae								&&

  message "Don't forget to enable CONFIG_FW_LOADER on your kernel!!"

) > $C_FIFO 2>&1
