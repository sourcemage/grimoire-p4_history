(
	prepare_install

	[ -d /usr/share/gotmail ] || mkdir /usr/share/gotmail
        [ -d /usr/doc/gotmail   ] || mkdir /usr/doc/gotmail
	cp sample.gotmailrc /usr/doc/gotmail

	cp gotmail /usr/bin/
	cp gotmail.1 /usr/man/man1/	

) > $C_FIFO  2>&1
