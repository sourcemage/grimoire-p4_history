./configure --prefix=/usr \
            --sysconfdir=/etc/leafnode \
            $OPTS                                               &&
make all                                                        &&
make install                                                    &&
cp $SCRIPT_DIRECTORY/leafnode.xinetd /etc/xinetd.d/leafnode	&&
mk /etc/leafnode                                                &&
cp $SOURCE_DIRECTORY/config.example /etc/leafnode/config        &&
chgrp news /etc/leafnode/config*                            	&&
chmod g+w /etc/leafnode/config*
