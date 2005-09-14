if [ "$UFRAW_VERSION" == "devel" ]; then
./autogen.sh &&
default_build
else
export PREFIX=/usr
make OPTIMIZE="" LOCAL_CFLAGS="$CFLAGS" LOCAL_LDFLAGS="$LDFLAGS"
fi