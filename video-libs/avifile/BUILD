#sedit  's:$subdirs plugins/libmad/libmad:$subdirs:'  configure  &&
#sedit  's/class const_iterator/public: class const_iterator/'   \
#       include/avm_map.h                                        &&

patch  -p1  <  $SCRIPT_DIRECTORY/loader-fix.patch   &&
sedit  's:extern "C" void exit(int);::'  configure  &&
default_build
