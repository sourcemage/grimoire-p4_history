cd  abi                                 &&

sedit "s/-pedantic -ansi//g" configure  &&

if [ "$THREADS" == "y" ]; then
   OPTS="$OPTS --enable-threads"
fi &&
if [ "$PLUGINS" == "y" ]; then
   OPTS="$OPTS --enable-builtin-plugins"
fi &&
if [ "$EOPTS" == "y" ]; then
   OPTS="$OPTS --enable-extra-optimization"
fi &&

default_build
