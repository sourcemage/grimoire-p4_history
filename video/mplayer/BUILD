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

if [ "$GUI" = "y" ]; then OPTS="$OPTS --enable-gui"; fi             &&
if [ "$JOYSTICK" = "y" ]; then OPTS="$OPTS --enable-joystick"; fi   &&
if [ "$OSD_MENU" = "y" ]; then OPTS="$OPTS --enable-menu"; fi       &&
if [ "$MENCODER" = "n" ]; then OPTS="$OPTS --disable-mencoder"; fi  &&

CFLAGS= ./configure  --prefix=/usr    \
             --confdir=/etc/mplayer   \
             --mandir=/usr/share/man  \
             $OPTS          &&

make
