if [ "$KRB4" == "y" ]; then
    OPTS="$OPTS --with-krb4"
else
    OPTS="$OPTS --without-krb4"
fi

cd  $SPELL-$VERSION/src

# 1.3.6 needs this hack and I'm not sure why
for i in $(find -name configure | sed -e 's/\/configure$//'); do 
sedit 's/test "x$ac_old_val" != "x$ac_new_val"/false/' $i/configure
done

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
