OPTS="$OPENLDAP_LDBM  \
      $OPTS"          &&

./configure  --build=$BUILD                        \
            --prefix=$INSTALL_ROOT/usr             \
        --sysconfdir=$INSTALL_ROOT/etc             \
           --infodir=$INSTALL_ROOT/usr/share/info  \
            --mandir=$INSTALL_ROOT/usr/share/man   \
     --localstatedir=$INSTALL_ROOT/var             \
            --enable-cleartext                     \
            --enable-crypt                         \
            --enable-rlookups                      \
                     $OPTS                         &&

make  depend  &&
make
