(

  patch  -p1  <  $SCRIPT_DIRECTORY/htb3.6_tc.diff  &&

	make	&&
	if spell_installed teTeX && spell_installed psutils; then
		cd $SOURCE_DIRECTORY/doc &&
		make
	fi
	cd $SOURCE_DIRECTORY	&&
	prepare_install		&&
	cp ./ip/ip /usr/sbin	&&
	cp ./ip/rtmon /usr/sbin	&&
	cp ./tc/tc /usr/sbin

) > $C_FIFO 2>&1

			
