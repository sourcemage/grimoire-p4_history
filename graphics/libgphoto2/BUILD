(

  if test "`gaze installed gphoto2`" = "2.1.0" ; then dispel gphoto2 ; fi 
  # upgrading from 2.1.0 fix for gphoto2, compiling gphoto2 later will dispel these new libs if old gphoto2 <= 2.1.0.
  # the libs will then be wiped, and that would be bad news, so we wipe it early if upgrading.
  # this spell used to be inside gphoto2, in case you are wondering.

  OPTS="$OPTS  --with-drivers=$DRIVER"
  patch -p0 < $SCRIPT_DIRECTORY/cam.diff camlibs/ptp2/library.c	&&
  default_build  &&
  cd  doc  &&
  make  install-man	&&

  if spell_installed hotplug; then
# create list of cameras
    FF=${INSTALL_ROOT}/etc/hotplug/usb/usbcam
    ${INSTALL_ROOT}/usr/lib/libgphoto2/print-usb-usermap > ${FF}.usermap
    if [ ! -f $FF ];then  
# enable hotplug to set permissions for device
      cp ${INSTALL_ROOT}/usr/share/doc/libgphoto2/linux-hotplug/usbcam.group $FF
      chmod u+x $FF
      sed -i -e "s/=camera/=video/" $FF
    fi
  fi
) > $C_FIFO 2>&1
