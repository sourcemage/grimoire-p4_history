(
    sedit "s/local\///g" src/Makefile         &&

    prepare_install                           &&
    make                                      &&
    make install                              &&
    mkdir -p ${INSTALL_ROOT}/etc/profile.d/   &&
    install -m 0644 $SCRIPT_DIRECTORY/libtrash.sh ${INSTALL_ROOT}/etc/profile.d/
) > $C_FIFO 2>&1
