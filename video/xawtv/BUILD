sedit  "s/gzip/gzip -f/"  Makefile.in      &&
default_build                              &&
#./configure  --prefix=${INSTALL_ROOT}/usr  \
#             --infodir=/usr/share/info     \
#             --mandir=/usr/share/man       \
#             ${OPTS}                       &&
#make                                       &&
# Compile fonts
cd  ${SOURCE2/.tar.bz2/}                   &&
make                                       &&
cd  ..
