if  /lib/libc.so.6 | grep -q NPTL; then
  # apply fix, not sure what parts of it are needed because of NPTL glibc,
  # linux 2.6 or gcc 3.4
  patch  -p0  <  $SCRIPT_DIRECTORY/nptl-fix.patch
fi           &&
xmkmf        &&
make  World  &&
cd    Xvnc   &&
./configure  &&
make 
