./configure  --prefix=${INSTALL_ROOT}/usr              \
             --sysconfdir=${INSTALL_ROOT}/etc          \
             --localstatedir=${INSTALL_ROOT}/var       \
             --mandir=${INSTALL_ROOT}/usr/share/man    \
             --infodir=${INSTALL_ROOT}/usr/share/info  \

             --with-hierarchy-level=${HIERARCHY_LEVEL} \
             --with-web-host=$(hostname)               \
             --with-ca-organization=${ORGANIZATION}    \
             --with-ca-country=${COUNTRY}              \
             $OPTS                                     &&
make
