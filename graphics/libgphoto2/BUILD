(

  if test "`gaze installed gphoto2`" = "2.1.0" ; then dispel gphoto2 ; fi 
  # upgrading from 2.1.0 fix for gphoto2, compiling gphoto2 later will dispel these new libs if old gphoto2 <= 2.1.0.
  # the libs will then be wiped, and that would be bad news, so we wipe it early if upgrading.
  # this spell used to be inside gphoto2, in case you are wondering.

  OPTS="$OPTS  --with-drivers=$DRIVER"
  patch -p0 < $SCRIPT_DIRECTORY/cam.diff camlibs/ptp2/library.c	&&
  default_build  &&
  cd  doc  &&
  make  install-man

) > $C_FIFO 2>&1
