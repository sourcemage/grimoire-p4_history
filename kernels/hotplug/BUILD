scripts()
#make symbolic links to start/stop hotplug
{
ln -s /etc/rc.d/init.d/hotplug /etc/rc.d/rc"$1".d/"$2"hotplug
}


(
  prepare_install             		&&
  cp sbin/hotplug /sbin/hotplug 	&&
  mkdir -p /etc/hotplug			&&
  cp -r etc/hotplug/* /etc/hotplug	&&
  mkdir -p /var/run/usb			&&
  chmod 700 /var/run/usb		&&
  cp etc/rc.d/init.d/hotplug /etc/rc.d/init.d/hotplug	&&
  mkdir -p /var/lock/subsys
  scripts 1 S11
  scripts 2 S11
  scripts 3 S11
  scripts 4 S11
  scripts S S36
  scripts 0 K89
  scripts 6 K89
#  cd /etc/rc.d/init.d			
#  chkconfig --add hotplug
) > $C_FIFO 2>&1
