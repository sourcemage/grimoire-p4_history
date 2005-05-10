# Make sure our CFLAGS are obeyed as well
sedit "s|CFLAGS=.*|\\0 $CFLAGS|g" cracklib/Makefile util/Makefile &&

# the wordlist needs to be in place before INSTALL runs
cp ${SOURCE_CACHE}/allwords ${INSTALL_ROOT}/usr/share/cracklib/     &&

make all
