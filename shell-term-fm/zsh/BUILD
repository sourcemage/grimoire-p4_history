(

    ./configure --bindir=/bin			\
		--prefix=/usr			\
		--disable-lfs			\
		--enable-function-subdirs	&&
    make					&&
    make    install

    ## install configuration files. ##
    if [ ! -f  /etc/zshenv ];  then
	cp  $SCRIPT_DIRECTORY/zshenv  /etc
    fi
    if [ ! -f /etc/zshrc  ];  then
	cp  $SCRIPT_DIRECTORY/zshrc  /etc
    fi

) > $C_FIFO 2>&1
