(

  patch  -p0  <  $SCRIPT_DIRECTORY/gcc-3.4.patch  &&

  default_build  &&
  echo  "YES"                     |
  galeon-config-tool  --install-schemas --fix-gconf-permissions
#  &&
#   echo  "YES"                     |
#  gconftool  -install-schema-file /etc/gconf/schemas/galeon.schemas

) > $C_FIFO 2>&1
