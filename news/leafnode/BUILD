(

./configure --prefix=/usr                                       \
            --localstatedir=/var                                \
            --sysconfdir=/etc/leafnode                          \
            $OPTS                                               &&

make all                                                        &&

prepare_install                                                 &&
make install                                                    &&

cp $SCRIPT_DIRECTORY/leafnode.xinetd /etc/xinetd.d/leafnode     &&

if [ ! -d /etc/leafnode ]; then
  mkdir /etc/leafnode
fi                                                              &&

cp $SOURCE_DIRECTORY/config.example /etc/leafnode/config        &&
chgrp news /etc/leafnode/config*                                &&
chmod g+w /etc/leafnode/config*

) > $C_FIFO 2>&1
