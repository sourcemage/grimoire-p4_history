# patch to make pidfile go to /var/run
patch -p0 < $SCRIPT_DIRECTORY/pid-file.patch &&

./configure  --build=$BUILD            \
             --prefix=/                \
             --sysconfdir=/etc         \
             --mandir=/usr/share/man   \
             --infodir=/usr/share/info \
             --localstatedir=/var      \
             $OPTS                     &&

sedit 's#mandir = /usr/man#mandir = /usr/share/man#' Makefile &&

make
