cd  ${INSTALL_ROOT}/usr/src/linux-${VERSION}


if  [[ -z $HOST ]]; then
  HOST=$BUILD
fi

if  [[ -z $ARCH ]]; then
  ARCH=$KERNEL_ARCH
fi

if  [[ $HOST != $BUILD ]]; then
  CROSS_COMPILE="${HOST}-"
fi

echo "ARCH is '${ARCH}', CROSS_COMPILE is '${CROSS_COMPILE}'"

run_make() {
  make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} INSTALL_MOD_PATH=${INSTALL_ROOT} "$@"
}
 
#
# Still run `make oldconfig` in BUILD if specified  (Bug #7256)
#
if  [  "$OLD_CONFIG"  ==  "y"  ];  then
  run_make  oldconfig
fi  &&

#
# If the architecture-dependent assembly hasn't been linked
# to the generic 'asm' directory, do so.
#
# 2003-10-10  sandalle
#

if [ ! -h  include/asm ]
then
  cd  include                &&
  ln  -sf  asm-${ARCH}  asm  &&
  cd  ..
fi  &&

#
# End fix
#

backup_modules()  {

  if    [  -d  ${INSTALL_ROOT}/lib/modules/$VERSION      ];  then
    rm   -rf   ${INSTALL_ROOT}/lib/modules/$VERSION.old
    mv         ${INSTALL_ROOT}/lib/modules/$VERSION      \
               ${INSTALL_ROOT}/lib/modules/$VERSION.old
  fi

}


(
  # there is a problematic line in the Makefile:
  # kbuild_2_4_nostdinc := -nostdinc $(shell $(CC) -print-search-dirs | sed -ne 's/install: \(.*\)/-I \1include/gp')
  # That leads to troubles on a localized system (if "install:" is translated)

  unset LANG
  
  cp  .config  $INSTALL_ROOT$CONFIG_CACHE/kernel.config
  run_make  dep               &&
  case  ${ARCH}  in
    sparc*)  run_make  vmlinux ||  return  1 ;;
       ppc)  run_make  vmlinux ||  return  1 ;;
        sh)  run_make   zImage ||  return  1 ;;
         *)  run_make  bzImage ||  return  1 ;;
  esac

  # Only install modules if module support is wanted
  if  grep  -q "CONFIG_MODULES=y"  .config;  then
    run_make   modules       &&
    backup_modules           &&
    prepare_install                      &&
    run_make   modules_install  ||  return  1;
  else
    prepare_install         ||  return  1;
  fi

  mkdir  -p  ${INSTALL_ROOT}/boot

  case  ${ARCH}  in
       ppc)  cp                 vmlinux     ${INSTALL_ROOT}/boot/vmlinux-$VERSION   &&
             ln  -sf  ${INSTALL_ROOT}/boot/vmlinux-${VERSION}                       \
                      ${INSTALL_ROOT}/boot/vmlinux                                  ;;
    sparc*)  gzip  -c9          vmlinux  >  ${INSTALL_ROOT}/boot/vmlinuz-$VERSION   &&
             ln  -sf  ${INSTALL_ROOT}/boot/vmlinuz-${VERSION}                       \
                      ${INSTALL_ROOT}/boot/vmlinuz                                  ;;
         *)  cp  arch/${ARCH}/boot/bzImage  ${INSTALL_ROOT}/boot/vmlinubz-$VERSION  &&
             ln  -sf  ${INSTALL_ROOT}/boot/vmlinubz-${VERSION}                      \
                      ${INSTALL_ROOT}/boot/vmlinubz                                 ;;
  esac

) > $C_FIFO 2>&1
