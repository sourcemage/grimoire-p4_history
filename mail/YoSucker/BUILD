(
	utils/CheckModules	

	prepare_install

	cp bin/* /usr/bin
	cp lib/* /usr/lib/perl5/$(gaze installed perl)/
	cp utils/Yo* /usr/bin
	
	[ -d /usr/share/YoSucker ] || mkdir /usr/share/YoSucker
	cp -a conf /usr/share/YoSucker/
	cp -a docs /usr/share/YoSucker/
	cp README /usr/share/YoSucker/
	cp utils/README /usr/share/YoSucker/utils.README	

) > $C_FIFO
