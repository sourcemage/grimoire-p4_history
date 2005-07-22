cd  ${LINUX_SOURCE_DIRECTORY}          &&
echo  "This is the version: $VERSION"  &&
case "$VERSION" in
  2.6*)
    echo "making for a 2.6 kernel"  &&
    ARCH="$kernel_arch" make $EXTRA_MAKE_OPTIONS || return 1
  ;;
  2.[024]*)
    echo "making for a 2.4 kernel"  &&
    ARCH="$kernel_arch" make dep    &&
    case  $kernel_arch  in
      sparc*)  ARCH="$kernel_arch"  make $EXTRA_MAKE_OPTIONS vmlinux  ||  return  1  ;;
         ppc)  LDFLAGS=${LDFLAGS/-s/} 
	       ARCH="$kernel_arch"  make $EXTRA_MAKE_OPTIONS vmlinux  ||  return  1  ;;
          sh)  ARCH="$kernel_arch"  make $EXTRA_MAKE_OPTIONS zImage  ||  return  1  ;;
           *)  ARCH="$kernel_arch"  make $EXTRA_MAKE_OPTIONS bzImage  ||  return  1  ;;
    esac  &&
    ARCH="$kernel_arch" make $EXTRA_MAKE_OPTIONS modules || return 1
  ;;
  *)
    echo "There is no kernel version: $VERSION"  &&
    return 1
  ;;
esac
