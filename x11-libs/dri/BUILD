(
  cd $SOURCE_DIRECTORY/xc-Trunk/xc                   &&
  make World                  &&
  cd $SOURCE_DIRECTORY/drm-Trunk/drm/linux &&
  make &&
  cd $SOURCE_DIRECTORY/xc-Trunk/xc &&
  prepare_install                  &&
if installed_spell xorg
then
  cp $SOURCE_DIRECTORY/xc-Trunk/xc/exports/lib/modules/dri/*.so /usr/X11R6/lib/modules/dri
  cp $SOURCE_DIRECTORY/xc-Trunk/xc/exports/lib/modules/extensions/libglx.a /usr/X11R6/lib/modules/extensions
  cp $SOURCE_DIRECTORY/xc-Trunk/xc/exports/lib/modules/extensions/libGLcore.a /usr/X11R6/lib/modules/extensions
  cp $SOURCE_DIRECTORY/xc-Trunk/xc/exports/lib/modules/extensions/libdri.a /usr/X11R6/lib/modules/extensions
  cp $SOURCE_DIRECTORY/xc-Trunk/xc/exports/lib/modules/drivers/*_drv.o /usr/X11R6/lib/modules/drivers
  cp $SOURCE_DIRECTORY/xc-Trunk/xc/exports/lib/*GL* /usr/X11R6/lib
  cp $SOURCE_DIRECTORY/xc-Trunk/xc/exports/lib/*Mesa* /usr/X11R6/lib
else
  make    install 
fi &&

#Let's install the proper modules

  mkdir -p /lib/modules/`uname -r`/kernel &&
  mkdir -p /lib/modules/`uname -r`/kernel/drivers &&
  mkdir -p /lib/modules/`uname -r`/kernel/drivers/char &&
  mkdir -p /lib/modules/`uname -r`/kernel/drivers/char/drm &&

if [ "`uname -r | cut -c-3`" == "2.6" ]; then
  cp $SOURCE_DIRECTORY/drm-Trunk/linux/drm/*.ko /lib/modules/`uname -r`/kernel/drivers/char/drm/
else
  cp $SOURCE_DIRECTORY/drm-Trunk/linux/drm/*.o /lib/modules/`uname -r`/kernel/drivers/char/drm/
fi &&
depmod -a

) > $C_FIFO 2>&1
