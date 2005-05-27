KERNEL_VER="`grep RELEASE /usr/src/linux/include/linux/version.h | awk '{print $3}'`"


message "${PROBLEM_COLOR}ATTENTION, ${DEFAULT_COLOR}You need these kernel modules compiles from your kernel or the driver won't work:"
message "${PROBLEM_COLOR}firmware_class \nARC4 cipher algorithm (crypto lib support) \nCRC32 (also in crypto lib support)\n${DEFAULT_COLOR}"

make KVER=$KERNEL_VER  
