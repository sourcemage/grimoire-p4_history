patch lib/mm/xlate.h $SCRIPT_DIRECTORY/xlate.h.patch  &&

./configure  --build=${BUILD}                  \
             --prefix=${INSTALL_ROOT}/usr      \
             --sbindir=${INSTALL_ROOT}/sbin    \
             --libdir=${INSTALL_ROOT}/lib      \
             --sysconfdir=${INSTALL_ROOT}/etc  \
             ${OPTS}                           &&
make
