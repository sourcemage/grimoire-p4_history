(

	./configure  --build=$BUILD                     \
               --prefix=/usr                            \
               --sysconfdir=/etc                        \
               --localstatedir=/var                     \
               $OPTS                                    &&
	make                                            &&

	#if spell_installed gpgme && spell_installed libgcrypt ;  then
	#	cd plugins/gaim-e/           &&
	#	sedit  "s:INSTALL_PATH=:INSTALL_PATH=/usr/lib/gaim:"  Makefile  &&
	#	make	&&
	#	cd ../..
	#fi

	prepare_install                                 &&
	make    install                                 &&
	cp plugins/*.pl /usr/lib/gaim                   &&

	if [ "$GAIM_ENCRYPTION" = "y" ] ; then
        export NSPRLIBS=$(gaze from libnspr4.so | cut -d: -f2 | cut -d/ -f1-4) &&
        export NSSLIBS=$(gaze from libnss3.so | cut -d: -f2 | cut -d/ -f1-4)   &&
		cd plugins/gaim-encryption-$VERSION2/   &&
		./configure                             \
                           --with-nspr-libs=$NSPRLIBS   \
                           --with-nss-libs=$NSSLIBS     &&
		make                                    &&
		make install
	fi

	#if spell_installed gpgme && spell_installed libgcrypt ;  then
	#	cd plugins/gaim-e/           &&
	#	make install	         &&
	#	cd ../..
	#fi

) > $C_FIFO 2>&1
