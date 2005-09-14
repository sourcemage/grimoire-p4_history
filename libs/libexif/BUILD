#if use_gcc 4.0
#then
	patch -p0 <$SCRIPT_DIRECTORY/exif-utils.h.patch &&
#fi &&
patch -p0 <$SCRIPT_DIRECTORY/patch-libexif-exif-data.c &&
if [ "$LIBEXIF_CVS" == "y" ]; then
./autogen.sh
fi
default_build
