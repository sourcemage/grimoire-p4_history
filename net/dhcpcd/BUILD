# patch to make pidfile go to /var/run
patch -p0 < $SCRIPT_DIRECTORY/pid-file.patch &&
patch -p0 < $SCRIPT_DIRECTORY/config.sub.patch &&

./configure  --build=$BUILD                           \
             --prefix=${INSTALL_ROOT}                 \
             --sysconfdir=${INSTALL_ROOT}/etc         \
             --mandir=${INSTALL_ROOT}/usr/share/man   \
             --infodir=${INSTALL_ROOT}/usr/share/info \
             --localstatedir=${INSTALL_ROOT}/var      \
             $OPTS                     &&

sedit 's#mandir = /usr/man#mandir = /usr/share/man#' Makefile &&

make
