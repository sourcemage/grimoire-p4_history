patch -p1 < $SCRIPT_DIRECTORY/OpenSP-1.5.1-LITLEN-1.patch           &&
if [ "$( installed_version gcc | cut -d . -f 1,2 )" == "3.4" ]; then
   patch -p1 < $SCRIPT_DIRECTORY/OpenSP-1.5.1-gcc34-1.patch
else
   patch -p0 < $SCRIPT_DIRECTORY/OpenSP-gcc3.3-fix.patch
fi                                                                   &&

./configure --prefix=${INSTALL_ROOT}/usr                 \
            --sysconfdir=${INSTALL_ROOT}/etc             \
            --localstatedir=${INSTALL_ROOT}/var          \
            --mandir=${INSTALL_ROOT}/usr/share/man       \
            --infodir=${INSTALL_ROOT}/usr/share/info     \
            --enable-http                                \
            --enable-xml-messages                        \
            --enable-default-catalog=/etc/sgml/catalog   \
            --enable-default-search-path=/usr/share/sgml \
            $OPTS                                        &&

make pkgdatadir=/usr/share/sgml/OpenSP

