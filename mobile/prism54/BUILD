(

#  patch -p0 < $SCRIPT_DIRECTORY/islpci.patch				&&
#  patch -p0 < $SCRIPT_DIRECTORY/isl_ioctl.diff				&&

  make KVER=$(installed_version linux) modules		&&
  prepare_install	&&
  make KVER=$(installed_version linux) install		&&

  mkdir -p /usr/lib/hotplug/firmware				&&
  cp ${SOURCE_CACHE}/${SOURCE2} /usr/lib/hotplug/firmware	&&
#  cp $SCRIPT_DIRECTORY/firmware.agent /etc/hotplug/		&&

  depmod -ae								&&

  message "Don't forget to enable CONFIG_FW_LOADER on your kernel!!"

) > $C_FIFO 2>&1
