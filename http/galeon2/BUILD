(

  sedit  "s/GtkToolbarChildType/EggToolbarChildType/"  libegg/eggtoolbar.c  &&
  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
               --localstatedir=/var \
               $OPTS              &&
  make                            &&
  prepare_install                 &&
  make    install                 &&
  echo  "YES"                     |
  galeon-config-tool  --install-schemas --fix-gconf-permissions
#  &&
#   echo  "YES"                     |
#  gconftool  -install-schema-file /etc/gconf/schemas/galeon.schemas

) > $C_FIFO 2>&1
