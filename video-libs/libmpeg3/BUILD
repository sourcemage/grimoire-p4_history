patch -p0 < $SCRIPT_DIRECTORY/Makefile-shared.patch  &&
patch -p0 < $SCRIPT_DIRECTORY/libmpeg3-fixes.patch   &&

if ! echo $CFLAGS | grep -q -- "-O."; then
  CFLAGS="$CFLAGS -O2"
fi  &&
if echo $CFLAGS | grep -q -- "-mmmx"; then
  USE_MMX=1
else
  USE_MMX=0
fi  &&
make USE_MMX=$USE_MMX
