#sedit  's:$subdirs plugins/libmad/libmad:$subdirs:'  configure  &&
#sedit  's/class const_iterator/public: class const_iterator/'   \
#       include/avm_map.h                                        &&

if grep UTS_RELEASE /usr/include/linux/version.h | grep -q \"2.6; then
  patch  -p1  <  $SCRIPT_DIRECTORY/loader-fix.patch
fi &&
sedit  's:extern "C" void exit(int);::'  configure  &&
default_build
