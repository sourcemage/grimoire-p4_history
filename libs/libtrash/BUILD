(
    mv src/Makefile src/Makefile.old    &&

    sed  -e 's/local\///g'              \
         -e 's/ginstall/install/g'      \
         < src/Makefile.old             \
         > src/Makefile

    prepare_install
    make
    make install

) > $C_FIFO 2>&1
