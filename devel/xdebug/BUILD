(
	PHP_EXT=`php-config --extension-dir`       &&

	patch -p0 < $SCRIPT_DIRECTORY/$SPELL.patch &&

	phpize                                     &&
	./configure --enable-xdebug                &&
	make                                       &&

	prepare_install                            &&
	make    install                            &&

	echo 'Add the following to /etc/php.ini: extension="$PHP_EXT/xdebug.so"'

) > $C_FIFO 2>&1
