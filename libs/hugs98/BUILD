(
    cd src/unix      &&
    ./configure --prefix=/usr &&
    cd ..            &&
    make clean       &&
    make             &&
    prepare_install  &&
    make install     &&
#    /usr/bin/hugs /usr/share/hugs/demos/Say
#    putStr (say "  /Hugs")
#    :quit
    make    install
) > $C_FIFO 2>&1
