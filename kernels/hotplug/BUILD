scripts()
#make symbolic links to start/stop hotplug
{
ln -sf /etc/rc.d/init.d/hotplug /etc/rc.d/rc"$1".d/"$2"hotplug
}


(
  prepare_install             		&&
  make install
  scripts 1 S11
  scripts 2 S11
  scripts 3 S11
  scripts 4 S11
  scripts S S36
  scripts 0 K89
  scripts 6 K89
) > $C_FIFO 2>&1
