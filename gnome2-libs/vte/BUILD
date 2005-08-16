if [ "$XFT2" == "y" ]; then
   OPTS="$OPTS --with-xft2"
fi                             &&

if [ "$PANGOX" == "y" ]; then
   OPTS="$OPTS --with-pangox"
fi                             &&

if [ "$GLX" == "y" ]; then
   OPTS="$OPTS --with-glX"
fi                             &&
make_single                    &&
default_build                  &&
make_normal
