(
if [ ! -f Makefile.orig ]
then
	cp Makefile Makefile.orig
fi

cp $SCRIPT_DIRECTORY/configure .
./configure $OPTS
export PAGER=""
make -j1
prepare_install
make install
) > $C_FIFO 2>&1
