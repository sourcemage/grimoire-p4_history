(
        ### had to cook up some pkg-config files for nss and nspr 
        if spell_installed nss
        then export PKG_CONFIG_PATH="/usr/include/nss:/usr/include/nspr" 
        fi                                              &&
	./configure  --build=$BUILD                     \
               --prefix=/usr                            \
               --sysconfdir=/etc                        \
               --localstatedir=/var                     \
               $OPTS                                    &&
	make                                            &&

	if [ "$GAIM_ENCRYPTION" = "y" ] ; then
	cd plugins/gaim-encryption-$VERSION2           &&
	./configure  --build=$BUILD                     \
               --prefix=/usr                            \
               --sysconfdir=/etc                        \
               --localstatedir=/var                     \
               $OPTS                                    &&
	make      
	fi                                              &&

	cd $SOURCE_DIRECTORY                            &&
	prepare_install                                 &&
	make    install                                 &&
	cp plugins/*.pl /usr/lib/gaim                   &&

	if [ "$GAIM_ENCRYPTION" = "y" ] ; then
	cd plugins/gaim-encryption-$VERSION2/           &&
	make install
	fi

#	if spell_installed gpgme ;  then
#		cd plugins/gaim-e/           &&
#		sedit  "s:INSTALL_PATH=:INSTALL_PATH=/usr/lib/gaim:"  Makefile       &&
#                export  "$(grep "GTK_CFLAGS =" ../Makefile | sed -e 's: = :=:' )"       &&
#                sedit "s/\-I ..\/..\/src/& $GTK_CFLAGS/" Makefile                    &&
#		make	&&
#		cd ../..
#	fi                                              &&
#	if spell_installed gpgme ;  then
#		cd plugins/gaim-e/           &&
#		make install	         &&
#		cd ../..
#	fi

) > $C_FIFO 2>&1
