if [ $(gcc -dumpversion | cut -d. -f1,2) == "3.4" ]; then
  patch  -p1  <  $SCRIPT_DIRECTORY/gcc-3.4.patch
fi  &&
default_build
