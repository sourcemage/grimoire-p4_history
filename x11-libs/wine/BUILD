# fix wine build problem
LDFLAGS=${LDFLAGS//-z combreloc/}                 &&
OPTS="--disable-debug --disable-trace ${OPTS}"    &&
# touch non-existant file
touch programs/winetest/tests.rc                  &&
default_build
