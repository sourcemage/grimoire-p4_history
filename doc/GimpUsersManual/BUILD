(

    prepare_install                                     &&

    mkdir  -p /usr/share/doc/$SPELL                     &&
    unpack $SOURCE  ${MD5[0]}                           &&
    unpack $SOURCE2 ${MD5[1]}                           &&
    cp $SOURCE_CACHE/$SOURCE  /usr/share/doc/$SPELL     &&
    cp $SOURCE_CACHE/$SOURCE2 /usr/share/doc/$SPELL

) > $C_FIFO 2>&1
