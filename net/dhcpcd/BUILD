# patch to make pidfile go to /var/run
patch -p0 < $SCRIPT_DIRECTORY/pid-file.patch &&

./configure  --build=$BUILD        \
             --prefix=/            \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&

make
