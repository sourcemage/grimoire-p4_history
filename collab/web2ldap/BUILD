(
	python  ./sbin/compile.py  &&

	prepare_install            &&

	mkdir -p /usr/share/$SPELL &&

	# do NOT force copy here because configuration is in
	# the $SOURCE_DIRECTORY/etc -> /usr/share/$SPELL/etc
	cp -R ./ /usr/share/$SPELL/

) > $C_FIFO 2>&1
