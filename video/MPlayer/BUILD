if [ "$(uname -m)" = "ppc" ]; then
  patch -p1 < $SCRIPT_DIRECTORY/mplayer-1.0_pre5-yuv2rbg_kludge.patch
fi  &&
# fixes bug #6833
patch  -p1  <  $SCRIPT_DIRECTORY/mplayer-headers.patch  &&

# mp3lib doesn't work with gcc 3.3.2 and -fomit-frame-pointer
sedit  's/-fomit-frame-pointer//'  configure       &&

patch  Makefile  $SCRIPT_DIRECTORY/Makefile.patch  &&
if [ "$CVS" = "y" ]; then
  patch -p1 < $SCRIPT_DIRECTORY/shared-ffmpeg.patch
else
  OPTS="$OPTS --enable-libavcodec"
fi  &&

case  $GUI  in
  y|Y)  OPTS="$OPTS  --enable-gui"  ;;
esac  &&

case  $JOYSTICK  in
  y|Y)  OPTS="$OPTS  --enable-joystick"  ;;
esac  &&

case  $OSD_MENU  in
  y|Y)  OPTS="$OPTS  --enable-menu"  ;;
esac  &&

CFLAGS= ./configure  --prefix=/usr    \
             --confdir=/etc/mplayer   \
             --mandir=/usr/share/man  \
             $OPTS          &&

make
