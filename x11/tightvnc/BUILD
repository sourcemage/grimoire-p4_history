if  glibc_is_nptl; then
  # apply fix, not sure what parts of it are needed because of NPTL glibc,
  # linux 2.6 or gcc 3.4
  patch  -p0  <  $SCRIPT_DIRECTORY/nptl-fix.patch
fi           &&
xmkmf        &&
make_single  &&
make  World  &&
cd    Xvnc   &&
./configure  &&
make 
