(

./configure --prefix=/usr                                       \
            --localstatedir=/var                                \
            --sysconfdir=/etc/leafnode                          \
            --with-lockfile=/var/lock/fetchnews.lck             \
            $OPTS                                               &&
make    all                                                     &&
prepare_install                                                 &&
make    install                                                 &&
mkdir  -p  /etc/leafnode                                        &&
cp $SOURCE_DIRECTORY/config.example /etc/leafnode/config        &&
chgrp news /etc/leafnode/config                                 &&
chmod g+w /etc/leafnode/config

) > $C_FIFO 2>&1
