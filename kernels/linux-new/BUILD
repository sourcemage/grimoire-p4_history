
cd ${LINUX_SOURCE_DIRECTORY}
echo "This is the version: $VERSION"
. ${CONFIG_CACHE}/details.conf
case "$VERSION" in
	2.6*)
		echo "making for a 2.6 kernel"
#		if [[ ! ${OPTIONAL_BUILD_DIR} ]]
#		then
			ARCH="$kernel_arch" make
#		else
#			mkdir -p ${OPTIONAL_BUILD_DIR}
#			ARCH="$kernel_arch" make O="${OPTIONAL_BUILD_DIR}"
#		fi
		;;
	2.[024]*)
		echo "making for a 2.4 kernel"
		ARCH="$kernel_arch" make dep &&
		ARCH="$kernel_arch" make bzImage && 
		ARCH="$kernel_arch" make modules 
		;;
	*)
		echo "There is no kernel version: $VERSION"
		return 1
		;;
esac
