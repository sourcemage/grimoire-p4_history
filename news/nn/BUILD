(

    patch -i   $SCRIPT_DIRECTORY/nn.patch       &&
    cp  config.h-dist  config.h                 &&

    make all                                    &&

    prepare_install                             &&

    ./inst s                                    

) > $C_FIFO 2>&1
