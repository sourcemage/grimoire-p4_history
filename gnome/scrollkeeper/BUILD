CFLAGS="$CFLAGS -I/usr/include/libxml2/libxml"

patch -p1 < $SCRIPT_DIRECTORY/$SPELL-security.patch

sedit "s/if xmlcatalog/if ! xmlcatalog/" configure

default_build
