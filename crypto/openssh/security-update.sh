#!/bin/sh

groupadd -g 95 sshd
useradd -g 95 -u 95 -d /var -s /bin/false sshd
mkdir /var/empty

echo "UsePrivilegeSeparation yes" >> /etc/ssh/sshd_config
