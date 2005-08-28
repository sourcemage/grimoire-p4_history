if test "$(get_spell_provider $SPELL GECKO)" = firefox; then
   patch -p1 < $SCRIPT_DIRECTORY/librsvg-firefox.diff  &&
   echo ${OPTS/mozilla/firefox}
fi &&

if [ "$RSVGENGINE" == "y" ]; then
   OPTS="$OPTS --enable-gtk-theme"
else
   OPTS="$OPTS --disable-gtk-theme"
fi                                      &&

CFLAGS="${CFLAGS} -I/usr/include/nspr"  && 

default_build
