(

    ./configure  --build=$BUILD        \
                 --prefix=/usr         \
                 --sysconfdir=/etc     \
                 --localstatedir=/var  \
                 $OPTS                 &&

    if  ! spell_installed netpbm; then
        patch  < $SCRIPT_DIRECTORY/groff.patch
    fi                                 &&

    make                               &&
    prepare_install                    &&
    make    install


) > $C_FIFO 2>&1
