if  grep UTS_RELEASE  /usr/include/linux/version.h | grep -q \"2.6; then
  # patch to fix undefined SCSI_BLK_MAJOR in apps using xine-lib
  patch  src/xine-utils/xine_check.c  $SCRIPT_DIRECTORY/xine-lib.patch
fi
# needed for xvid
export  LDFLAGS="$LDFLAGS -lm"  &&
# breaks with -Os
export  CFLAGS=${CFLAGS/-Os/}  &&
default_build
