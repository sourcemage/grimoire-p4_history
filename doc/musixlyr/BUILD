(

    MUSIXDIR=`kpsewhich musixtex`                               &&
    MUSIXDIR=`echo $MUSIXDIR | sed -e "s/musixtex\.tex//g"`     &&

    prepare_install                                             &&
    
    cp  musixlyr.tex  $MUSIXDIR                                 &&
    cp  mxlyrdoc.tex  /usr/doc/$SPELL                           &&
    cp  README        /usr/doc/$SPELL

) > $C_FIFO 2>&1
