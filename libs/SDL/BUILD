(
  bzcat  ${SOURCE_CACHE}/${SOURCE2}  |  patch  -p1  &&
  patch  src/audio/alsa/SDL_alsa_audio.h  $SCRIPT_DIRECTORY/alsa-1.0.patch  &&
  if  grep UTS_RELEASE  /usr/include/linux/version.h | grep -q \"2.6; then
  CFLAGS="$CFLAGS -D__KERNEL_STRICT_NAMES"
  fi &&
  OPTS="$OPTS --enable-video-directfb=no" &&
  default_build

)  >  ${C_FIFO}  2>&1

