(
  cd $SOURCE_DIRECTORY/xc-Trunk/xc                   &&
  make World                  &&
  cd $SOURCE_DIRECTORY/drm-Trunk/drm/linux &&
  make &&
  cd $SOURCE_DIRECTORY/xc-Trunk/xc &&
  prepare_install                  &&
  make    install                  &&
  
#Let's install the proper modules

  mkdir -p /lib/modules/`uname -r`/kernel &&
  mkdir -p /lib/modules/`uname -r`/kernel/drivers &&
  mkdir -p /lib/modules/`uname -r`/kernel/drivers/char &&
  mkdir -p /lib/modules/`uname -r`/kernel/drivers/char/drm &&

if [ "`uname -r | cut -c-3`" == "2.6" ]; then
  cp $SOURCE_DIRECTORY/xc-Trunk/xc/programs/Xserver/hw/xfree86/os-support/linux/drm/kernel/*.ko /lib/modules/`uname -r`/kernel/drivers/char/drm/
else
  cp $SOURCE_DIRECTORY/xc-Trunk/xc/programs/Xserver/hw/xfree86/os-support/linux/drm/kernel/*.o /lib/modules/`uname -r`/kernel/drivers/char/drm/
fi &&
depmod -a

) > $C_FIFO 2>&1
