(
	# Patches

	# Debian patch to get splashimage working
	bzcat  ${SCRIPT_DIRECTORY}/grub-0.93-debian.patch.bz2 | patch -p1 &&

	# gcc 3.3 patch from LFS
	bzcat  ${SOURCE_CACHE}/${SOURCE2}  |  patch  -p1  &&

	# The patches were obtained from Red Hat
	bzcat  ${SCRIPT_DIRECTORY}/grub.patch.bz2  |  patch -p1  &&


	# malign is obsolete
	sedit  's/malign-jumps/falign-jumps/'  configure  &&
	sedit  's/malign-loops/falign-loops/'  configure  &&
	sedit  's/malign-functions/falign-functions/'  configure  &&

	if [ ! -e /boot/grub ]; then
		mkdir /boot/grub
	fi

	unset CFLAGS
	unset CXXFLAGS
	CFLAGS="-Os -g" ; export CFLAGS

	./configure	--build=$BUILD			\
			--prefix=/usr			\
			--sbindir=/sbin			\
	 		--mandir=/usr/share/man		\
			--infodir=/usr/share/info	\
			$OPTS				&&

	# Graphics patch made by me
	# noticed even though the graphics patch applies 
	# correctly, the information is not copied over
	# to the Makefile correctly

	patch -p1 < $SCRIPT_DIRECTORY/grub-0.93-Makefile.patch

	make                             &&
	prepare_install                  &&
	make    install                  &&

	chmod 750 /sbin/grub* 		 &&

	#  Sample image, replace with SMGL image
	mkdir -p /boot/grub/images/ &&
	cp  $SCRIPT_DIRECTORY/smgl-splash.xpm.gz  /boot/grub/images
	# this will create a sensible menu.lst.skel in the future

) > $C_FIFO 2>&1
