(

	case $IMAP_MAILSUBDIR in
	y|Y|j|J)
		patch -p1 < $SCRIPT_DIRECTORY/mailsubdir.patch
		;;
	*)
		true
		;;
	esac                                                                   &&

	if spell_installed openssl; then
		message "${MESSAGE_COLOR}Building with OpenSSL...${DEFAULT_COLOR}" &&
		SSLOPTS="SSLTYPE=unix               \
			SSLCERTS=/etc/ssl/certs         \
			SSLINCLUDE=/usr/include/openssl \
			SSLLIB=/usr/lib"
	else
		SSLOPTS=
	fi                                                                     &&

	if spell_installed Linux-PAM; then
		message "${MESSAGE_COLOR}Building with PAM...${DEFAULT_COLOR}"     &&
		TARGET=lnp
	else
		TARGET=slx
	fi

	make DEBUG="$CFLAGS" $SSLOPTS $TARGET                                  &&
    prepare_install

) > $C_FIFO 2>&1 && (

	#
	# Install c-cient
	#
	mkdir  -p                         /usr/include/imap
	cp     -f  ./c-client/*.h         /usr/include/imap/
	cp     -f  ./c-client/c-client.a  /usr/lib/libc-client.a

	cp  -f  ./imapd/imapd   /usr/sbin/
	cp  -f  ./ipopd/ipop2d  /usr/sbin/
	cp  -f  ./ipopd/ipop3d  /usr/sbin/
	cp  -f  ./mtest/mtest   /usr/bin/

	if  spell_installed  stunnel;  then
		ln  -sf  stunnel.pem  /etc/ssl/certs/imapd.pem
		ln  -sf  stunnel.pem  /etc/ssl/certs/ipop3d.pem
	fi

)
