(

	# kill remnants of CVS, but make sure we're in the proper directory
	[ `pwd` == $SOURCE_DIRECTORY ]                 &&
	rm -fr `find ./ -type d -and -name CVS`        &&
	rm -fr `find ./ -type f -and -name .cvsignore` &&

	prepare_install                                &&

    mkdir -p    /usr/share/$SPELL                  &&
    cp    -r ./ /usr/share/$SPELL/                 &&

	# now we delete all files so that nothing is picked for documentation
	# and duplicated in /usr/doc/$SPELL
	# bugzilla refers to docs/ URI in the bug submission page anyway
	rm    -fr *
    
) > $C_FIFO 2>&1
