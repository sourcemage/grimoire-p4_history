patch -p0 < ${SCRIPT_DIRECTORY}/Makefile.am.patch  &&
/bin/sh ./bootstrap                                &&
./configure  --sysconfdir=${INSTALL_ROOT}/etc  \
             --prefix=${INSTALL_ROOT}/usr      \
             --with-mp4v2                      \
             $OPTS                             &&
make
