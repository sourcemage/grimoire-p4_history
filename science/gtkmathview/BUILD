export OPTS="$OPTS --with-libxml2" &&
if [[ $(gcc -dumpversion)   == 3.3* ]] ; then
sedit '23a\
\#include \<assert.h\>\' src/ChildList.cc &&
sedit '26a\
\#include \<assert.h\>\' src/MathMLElement.hh &&
sedit '23a\
\#include \<assert.h\>\' src/MathMLEmbellishment.cc
fi  &&
sedit '1i#include <math.h>'  src/gtkmathview.cc  &&
default_build
