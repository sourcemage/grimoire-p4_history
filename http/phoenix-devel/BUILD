(
	cd /usr/src/mozilla &
	make -f client.mk build &&
	prepare_install
	make install
#	rm -R /usr/src/mozilla
	rm $HOME/.mozconfig
) > $C_FIFO 2>&1
