(

	prepare_install                                &&

    mkdir -p    /usr/share/$SPELL                  &&
    cp    -fr . /usr/share/$SPELL/                 &&
    chmod 0666  /usr/share/$SPELL/html/config*.php &&

    echo "Please point your apache at /usr/share/$SPELL/html and request install.php"
    
) > $C_FIFO 2>&1
