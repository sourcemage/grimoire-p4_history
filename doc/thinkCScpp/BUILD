(

    latex     --interaction nonstopmode  top
    makeindex top                                       &&
    latex     --interaction nonstopmode  top
    
    dvips -o thinkCScpp.ps top                          &&

    prepare_install                                     &&

    mkdir  -p      /usr/share/doc/$SPELL                &&
    cp  $SPELL.ps  /usr/share/doc/$SPELL/

) > $C_FIFO 2>&1
