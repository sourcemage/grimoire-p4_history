(
sedit '/#include <libxml\/hash.h>/i\
\#include \<libxml\/parser.h\>' libgdome/gdome-refdebug.c &&
sedit '/#include <libxml\/hash.h>/i\
\#include \<libxml\/parser.h\>' libgdome/gdome.c          &&
  ./configure                   \
  --host=$BUILD                 \
  --prefix=${INSTALL_ROOT}/usr  &&
  make                          &&
  prepare_install               &&
  make  install

) > $C_FIFO 2>&1
