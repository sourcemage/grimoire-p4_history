OPTS="$OPTS --with-swatdir=/usr/share/swat --with-smbmount --with-fhs  \
    --with-automount --with-winbind --with-libsmbclient"               &&

patch  -p0  <  $SCRIPT_DIRECTORY/krb5config.patch  &&
pushd  source                                      &&
default_build
