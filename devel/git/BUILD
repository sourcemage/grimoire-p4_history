patch -p0 < $SPELL_DIRECTORY/Makefile.diff &&
make HOME="${TRACK_ROOT}/usr"
if [[ $GIT_DOCS == "y" ]]
then
	make -C Documentation
fi
