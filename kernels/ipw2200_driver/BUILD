KERNEL_VER="$(grep RELEASE /usr/src/linux/include/linux/version.h | awk '{print $3}')"
modprobe -q firmware_class
make KVER=$KERNEL_VER  &&
make install KVER=$KERNEL_VER
