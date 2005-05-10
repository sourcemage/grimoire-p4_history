if use_gcc 4.0
then
	CFLAGS="${CFLAGS/-O3/-O2}"
fi &&
gzip -cd $SPELL_DIRECTORY/wget-filter-controls.patch.gz |
patch -p1 && default_build
