(

	# kill remnants of CVS, but make sure we're in the proper directory
	[ `pwd` == $SOURCE_DIRECTORY ]                 &&
	rm -fr `find ./ -type d -and -name CVS`        &&
	rm -fr `find ./ -type f -and -name .cvsignore` &&

	# change perl invocation path
	for F in `find -maxdepth 1 -type f`; do
		perl -pi -e "s@/usr/bonsaitools/bin/perl@`which perl`@" $F
	done                                           &&

	prepare_install                                &&

    mkdir -p    /usr/share/$SPELL                  &&
    cp    -r ./ /usr/share/$SPELL/                 &&

	# now we delete all files so that nothing is picked for documentation
	# and duplicated in /usr/doc/$SPELL
	# bugzilla refers to docs/ URI in the bug submission page anyway
	rm    -fr *                                    &&

	# still, it's good to have docs
	if [ -d /usr/doc/$SPELL ]; then
		rm -fr /usr/doc/$SPELL/
	fi                                             &&
	ln -nsf /usr/share/$SPELL/docs /usr/doc/$SPELL &&
	chmod -R 755 /usr/doc/$SPELL
    
) > $C_FIFO 2>&1
