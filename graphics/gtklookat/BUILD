(
 
	echo "gtklookat 0.13.0 will only build against openvrml 0.13.0" &&
	mv configure conf.old &&
	sed -e '2724D' conf.old >configure &&
    chmod +x configure &&
	default_build
 
) > $C_FIFO 2>&1
