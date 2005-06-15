# patch to make pidfile go to /var/run
patch -p0 < $SCRIPT_DIRECTORY/pid-file.patch &&
patch -p0 < $SCRIPT_DIRECTORY/config.sub.patch &&

./configure  --build=$BUILD                           \
             --prefix=${TRACK_ROOT}                 \
             --sysconfdir=${TRACK_ROOT}/etc         \
             --mandir=${TRACK_ROOT}/usr/share/man   \
             --infodir=${TRACK_ROOT}/usr/share/info \
             --localstatedir=${TRACK_ROOT}/var      \
             $OPTS                     &&

sedit 's#mandir = /usr/man#mandir = /usr/share/man#' Makefile &&

make DESTDIR=${INSTALL_ROOT}
