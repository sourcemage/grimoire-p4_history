# fix ldap problem ( wine bug #3265)
patch -p0 < $SPELL_DIRECTORY/ldap.diff            &&
# fix wine build problem
LDFLAGS=${LDFLAGS//-z combreloc/}                 &&
OPTS="--disable-debug --disable-trace ${OPTS}"    &&
# touch non-existant file
touch programs/winetest/tests.rc                  &&
default_build &&
if  spell_ok  docbook-utils;  then
  make -C documentation doc
fi
