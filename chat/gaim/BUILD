(

	./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
	make                               &&

	#if spell_installed gpgme && spell_installed libgcrypt ;  then
	#	cd plugins/gaim-e/           &&
	#	sedit  "s:INSTALL_PATH=:INSTALL_PATH=/usr/lib/gaim:"  Makefile  &&
	#	make	&&
	#	cd ../..
	#fi

	prepare_install                    &&
	make    install		     &&
	cp plugins/*.pl /usr/lib/gaim      &&

	if [ "$GAIM_ENCRYPTION" = "y" ] ; then
		cd plugins/gaim-encryption-2.05/	&&
		./configure								&&
		make										&&
		make install
	fi

	#if spell_installed gpgme && spell_installed libgcrypt ;  then
	#	cd plugins/gaim-e/           &&
	#	make install	         &&
	#	cd ../..
	#fi

) > $C_FIFO 2>&1
