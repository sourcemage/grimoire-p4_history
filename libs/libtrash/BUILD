(
    sedit "s/local\///g" src/Makefile         &&

    prepare_install                           &&
    make                                      &&
    make install                              &&
    if  ! grep -q libtrash.so ${INSTALL_ROOT}/etc/profile && [ "$LOGDEFS" = "yes" ] ; then
    echo -e "export LD_PRELOAD=${INSTALL_ROOT}/usr/lib/libtrash.so" >> ${INSTALL_ROOT}/etc/profile 
    fi
) > $C_FIFO 2>&1
