(
    
    prepare_install                           &&

    mkdir  -p  /usr/doc/$SPELL                &&

    cp  cleanscore       /usr/sbin/           &&

    chmod 555            /usr/sbin/cleanscore &&
    
    cp  COPYING          /usr/doc/$SPELL      &&
    cp  COPYRIGHT        /usr/doc/$SPELL      &&
    cp  INDEX.TXT        /usr/doc/$SPELL      &&
    cp  NEWS.cleanscore  /usr/doc/$SPELL      &&
    cp  README           /usr/doc/$SPELL  

) > $C_FIFO 2>&1
