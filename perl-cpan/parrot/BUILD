(

    perl Configure.pl 				     &&
    make                                             &&
    prepare_install                                  &&
    make  install DESTDIR=${INSTALL_ROOT} 	     &&
    install -m 0644 $SCRIPT_DIRECTORY/parrot.sh ${INSTALL_ROOT}/etc/profile.d/

) > $C_FIFO 2>&1
