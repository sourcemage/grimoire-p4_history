if  grep UTS_RELEASE  /usr/include/linux/version.h | grep -q \"2.6; then
  # no framebuffer on 2.6 due to borked headers
  sedit  '30iac_cv_header_linux_fb_h=no'  configure
fi
# needed for xvid
export  LDFLAGS="$LDFLAGS -lm"  &&
# breaks with -Os
export  CFLAGS=${CFLAGS/-Os/}  &&
default_build
