if [ "$SELINUX" == "y" ]; then
   OPTS="$OPTS --enable-selinux"
fi                                              &&
if [ "$PMOUNT" == "y" ]; then
   patch -p0 < $SCRIPT_DIRECTORY/fix-user-mount.patch
fi                                              &&

OPTS="$OPTS --with-pid-file=/var/run/hald.pid \
	    --enable-sysfs-carrier --enable-hotplug-map"  &&
default_build
