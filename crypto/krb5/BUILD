# MIT krb5 Security Advisory 2005-001
# Buffer overflows in telnet client
patch --verbose krb5-1.4/src/appl/telnet/telnet/telnet.c < $SCRIPT_DIRECTORY/2005-001-patch_1.4.txt  &&

if [ "$KRB4" == "y" ]; then
    OPTS="$OPTS --with-krb4"
else
    OPTS="$OPTS --without-krb4"
fi

cd  $SPELL-$VERSION/src

./configure  --enable-dns-for-kdc       \
             --enable-dns-for-realm     \
             --infodir=/usr/share/info  \
             --mandir=/usr/share/man    \
             --enable-shared            \
             --prefix=/usr              \
             --localstatedir=/var       \
             $OPTS                      &&
make_single                             &&
make
