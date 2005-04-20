# fixes bug #6833
patch  -p1  <  $SCRIPT_DIRECTORY/mplayer-headers.patch  &&

# mp3lib doesn't work with gcc 3.3.2 and -fomit-frame-pointer
# with gcc 3.4 -fomit-frame-pointer works and is needed to compile
if gcc -dumpversion | grep -q ^3.3; then
  sedit  's/-fomit-frame-pointer//'  configure
fi &&

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

CFLAGS= ./configure  --prefix=${INSTALL_ROOT}/usr    \
             --confdir=${INSTALL_ROOT}/etc/mplayer   \
             --mandir=${INSTALL_ROOT}/usr/share/man  \
             $OPTS          &&

make
