(

    patch  -p1  <  $SCRIPT_DIRECTORY/nn.patch   &&
    cp  config.h-dist  config.h                 &&

    make  CFLAGS="-Iconf $CFLAGS"  all          &&

    prepare_install                             &&

    ./inst s                                    

) > $C_FIFO 2>&1
