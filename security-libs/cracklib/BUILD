# Make sure our CFLAGS are obeyed as well
./configure $OPTS &&
sedit "s|CFLAGS=.*|\\0 $CFLAGS|g" lib/Makefile util/Makefile &&

# the wordlist needs to be in place before INSTALL runs
cp ${SOURCE_CACHE}/allwords ${INSTALL_ROOT}/usr/share/cracklib/     &&
sedit "s#usr/local/lib#usr/share/dict#g" Makefile            &&
sedit "s#/usr/dict/words#\"/usr/share/cracklib/*\"#g" Makefile &&
make all
