message  "${MESSAGE_COLOR}Building X.org takes a very long time${DEFAULT_COLOR}"  &&

#
# Remove explicit PIC as well as that breaks the symbol logic in
# /usr/X11R6/lib/modules/fonts/libbitmap.a:bitmapmod.o
#
export  CFLAGS="${CFLAGS/-DPIC -fPIC/}"  &&

if  (echo $CFLAGS | grep -q -- "-Os"); then
  export CFLAGS="-O2 ${CFLAGS//-Os/}"
fi  &&

#
# Reconfigure the drivers to what we've defined
#
cd  programs/Xserver   &&
make  Makefile         &&
make  Makefiles        &&
make  includes         &&
make  depend           &&
make                   &&
cd  $SOURCE_DIRECTORY  &&

make  World
