local BACKENDS="aqhbci aqdtaus aqofxconnect"  &&
local FRONTENDS="cbanking"                    &&

if [ "${AQBANKING_GTK}" == "y" ]; then
   local FRONTENDS="${FRONTENDS} g2banking"
fi  &&

#if [ "${AQBANKING_QT}" == "y" ]; then
#   local FRONTENDS="${FRONTENDS} qbanking"   &&
#   local BACKENDS="${BACKENDS} aqgeldkarte"
#else
#   OPTS="${OPTS} --disable-qt3"
#fi  &&

#if [ "${AQBANKING_KDE}" == "y" ]; then
#   local FRONTENDS="${FRONTENDS} kbanking"
#else
#   OPTS="${OPTS} --disable-kde3"
#fi  &&

#if [ "${AQBANKING_QTTHREADS}" == "y" ]; then
#   OPTS="${OPTS} --enable-qt3-treads"
#fi  &&

OPTS="${OPTS} --disable-qt3 --disable-kde3"  &&

./configure --build=${BUILD}                           \
            --host=${HOST}                             \
            --prefix=${INSTALL_ROOT}/usr               \
            --sysconfdir=${INSTALL_ROOT}/etc           \
            --localstatedir=${INSTALL_ROOT}/var        \
            --mandir=${INSTALL_ROOT}/usr/share/man     \
            --infodir=${INSTALL_ROOT}/usr/share/info   \
            --with-backends="${BACKENDS}"              \
            --with-frontends="${FRONTENDS}"            \
            $OPTS                                      &&

make

