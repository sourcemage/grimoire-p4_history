(

    if  [  $JAVA_SCRIPT  ==  'y'  ]; then
         USEJAVA="--enable-javascript"
    fi

    if  [  $GUI  ==  'y'  ]; then
        USEGUI="--enable-graphics"
    fi

    ./configure  --build=$BUILD        \
                 --prefix=/usr         \
                 --sysconfdir=/etc     \
                 --localstatedir=/var  \
                $USEJAVA               \
                $USEGUI                \
    make                               &&
    prepare_install                    &&
    make    install

) > $C_FIFO 2>&1
