echo "This is the version: $VERSION"
case "$VERSION" in
	2.6*)
		echo "making for a 2.6 kernel"
		make
		;;
	2.4*)
		echo "making for a 2.4 kernel"
		make dep &&
		make 
		;;
	2.2*)
		echo "making for a 2.2 kernel"
		echo "This part isn't implemented yet"
		exit 1
		;;
	2.0*)
		echo "making for a 2.0 kernel"
		echo "This part isn't implemented yet"
		exit1
		;;
	*)
		echo "There is no kernel version: $VERSION"
		exit 1
		;;
esac
