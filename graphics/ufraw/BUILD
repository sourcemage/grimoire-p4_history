if [ "$UFRAW_CVS" == "y" ]; then
default_build
else
export PREFIX=/usr
make OPTIMIZE="" LOCAL_CFLAGS="$CFLAGS" LOCAL_LDFLAGS="$LDFLAGS"
fi