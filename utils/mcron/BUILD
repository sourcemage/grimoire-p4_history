(
    ./configure  --build=$BUILD              \
        --prefix=${INSTALL_ROOT}/usr         \
        --sysconfdir=${INSTALL_ROOT}/etc     \
        --localstatedir=${INSTALL_ROOT}/var  \
        $OPTS                                &&
  
    make &&
    prepare_install &&
    make install &&
    mkdir -p /var/cron/tabs &&
    echo "root" > /var/cron/allow &&
    touch /var/cron/deny &&

) > $C_FIFO 2>&1
