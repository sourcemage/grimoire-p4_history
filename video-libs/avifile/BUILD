patch  -p1  <  $SCRIPT_DIRECTORY/avifile-fixes.patch  &&
sedit  's:extern "C" void exit(int);::'  configure    &&
sedit  's:\(@includedir@/avifile\):\1-0.7:' avifile.pc.in  &&
default_build
