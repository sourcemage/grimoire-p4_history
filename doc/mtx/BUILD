(

    cd      prepmx/p2c                          &&
    gcc     *.c -o      prepmx                  &&

    cd $OLDPWD                                  &&

    prepare_install                             &&

    mkdir  -p /usr/doc/$SPELL                   &&

    cp     prepmx/p2c/prepmx  /usr/bin          &&
    cp  -r source/           /usr/doc/$SPELL

) > $C_FIFO 2>&1
