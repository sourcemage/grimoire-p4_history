(
#gcc3.3 hack
if gcc -dumpversion > /dev/null ==3.3 ; then
sedit '27a\
\#include \<assert.h\>\' src/gdome_cpp_smart/test/main.cc
fi  &&
 default_build

)  >  ${C_FIFO}  2>&1
