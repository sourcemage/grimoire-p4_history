bzcat  ${SOURCE_CACHE}/${SOURCE2}  |  patch  -p1  &&
patch  src/audio/alsa/SDL_alsa_audio.h  $SCRIPT_DIRECTORY/alsa-1.0.patch  &&
OPTS="$OPTS --enable-video-directfb=no" &&
default_build
