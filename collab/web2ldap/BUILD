# $Id: BUILD,v 1.2 2002/06/03 03:42:23 sergeyli Exp $
(
	python  ./sbin/compile.py  &&

	prepare_install            &&

	mkdir -p /usr/share/$SPELL &&

	# do NOT force copy here because configuration is in
	# the $SOURCE_DIRECTORY/etc -> /usr/share/$SPELL/etc
	cp -R ./ /usr/share/$SPELL/

) > $C_FIFO 2>&1
