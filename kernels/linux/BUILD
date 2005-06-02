cd  ${LINUX_SOURCE_DIRECTORY}          &&
echo  "This is the version: $VERSION"  &&
case "$kernel_arch" in
	i*86)
		CFLAGS=${CFLAGS/-fPIC/}
		CFLAGS=${CFLAGS/-DPIC/}
		CFLAGS="$CFLAGS -msoft-float -mpreferred-stack-boundary=2 -fno-unit-at-a-time -Iinclude/asm-i386/mach-default -Wdeclaration-after-statement -Wstrict-prototypes -fomit-frame-pointer -Wno-trigraphs -fno-common -ffreestanding"
		;;
	*)
		;;
esac

case "$VERSION" in
  2.6*)
    echo "making for a 2.6 kernel"  &&
    ARCH="$kernel_arch" make  || return 1
  ;;
  2.[024]*)
    echo "making for a 2.4 kernel"  &&
    ARCH="$kernel_arch" make dep    &&
    case  $kernel_arch  in
      sparc*)  ARCH="$kernel_arch"  make  vmlinux  ||  return  1  ;;
         ppc)  ARCH="$kernel_arch"  make  vmlinux  ||  return  1  ;;
          sh)  ARCH="$kernel_arch"  make   zImage  ||  return  1  ;;
           *)  ARCH="$kernel_arch"  make  bzImage  ||  return  1  ;;
    esac  &&
    ARCH="$kernel_arch" make modules || return 1
  ;;
  *)
    echo "There is no kernel version: $VERSION"  &&
    return 1
  ;;
esac
