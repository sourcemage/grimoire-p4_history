OPTS="$OPTS  $KDEBASE_XCONSOLE  $KDEBASE_DPMS  $KDEBASE_XDMCP"  &&

#
# Kerberos has linking errors :(
#
#if  [  "$KDEBASE_KRB4"  ==  "y"  ];  then
#  OPTS="$OPTS  --with-krb4"
#fi  &&
#
#if  [  "$KDEBASE_KRB5"  ==  "y"  ];  then
#  OPTS="$OPTS  --with-krb5auth"
#fi  &&

source  $SECTION_DIRECTORY/KDE_BUILD &&

# Backup existing kdm dir
if [[ $VERSION == `installed_version $SPELL` ]] &&
   [ -d "$INSTALL_ROOT/usr/share/config/kdm" ]; then
  echo "Backing up configuration files..."            &&
  cp -r $INSTALL_ROOT/usr/share/config/kdm $TMP_DIR
fi
