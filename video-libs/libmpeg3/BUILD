invoke_gcc
# fails to compile with -DPIC -fPIC
CFLAGS=${CFLAGS/-DPIC/}  &&
CFLAGS=${CFLAGS/-fPIC/}  &&

if ! echo $CFLAGS | grep -q -- "-O."; then
  CFLAGS="$CFLAGS -O2"
fi  &&
if echo $CFLAGS | grep -q -- "-mmmx"; then
  USE_MMX=1
else
  USE_MMX=0
fi  &&
make USE_MMX=$USE_MMX
