(
    export CPPFLAGS=-I/usr/include/freetype2	&&

if [ "$CVS" = "yes" ]; then
    ./autogen.sh
fi &&

if [ "$NLS" = "no" ]; then
    OPTS="$OPTS --disable-nls"

fi &&

    default_build

) > $C_FIFO 2>&1
