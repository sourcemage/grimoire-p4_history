(

    gcc $OPTS abc2ps.c -o abc2ps

    prepare_install                                     &&
    
    cp  abc2ps  /usr/bin                                &&
    
    mkdir -p            /usr/doc/$SPELL                 &&
    cp  *.abc *.txt     /usr/doc/$SPELL                 &&
    cp  New.Features                                    \
        ReadMe.abc2ps   /usr/doc/$SPELL

) > $C_FIFO 2>&1
