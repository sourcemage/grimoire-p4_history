cd  ${INSTALL_ROOT}/usr/src/linux-${VERSION}


if  [[ -z $HOST ]]; then
  HOST=$BUILD
fi

  case  `uname -m`  in
       alpha) ARCH=alpha   ;;
         arm) ARCH=arm     ;;
        cris) ARCH=cris    ;; 
        ia64) ARCH=ia64    ;;
        i*86) ARCH=i386    ;;
        m68k) ARCH=m68k    ;;
        mips) ARCH=mips    ;;
      mips64) ARCH=mips64  ;;
      parisc) ARCH=parisc  ;;
     powerpc) ARCH=ppc     ;;
         ppc) ARCH=ppc     ;;
   powerpc64) ARCH=ppc64   ;;
        s390) ARCH=s390    ;;
       s390x) ARCH=s390x   ;;
         sh*) ARCH=sh      ;;
       sparc) ARCH=sparc   ;;
     sparc64) ARCH=sparc64 ;;
      x86_64) ARCH=x86_64  ;;
esac

if  [[ $HOST != $BUILD ]]; then
  CROSS_COMPILE="${HOST}-"
fi

echo "ARCH is '${ARCH}', CROSS_COMPILE is '${CROSS_COMPILE}'"

run_make() {
  make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} INSTALL_MOD_PATH=${INSTALL_ROOT} "$@"
}
 
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

if  [  -f  $INSTALL_ROOT$CONFIG_CACHE/kernel.config  ]; then
  cp $INSTALL_ROOT$CONFIG_CACHE/kernel.config .config
fi

if  query  "make oldconfig? "  n
  then  run_make oldconfig
fi

# use a more modern config tool if possible
CFGTYPE=menuconfig
if [[ ! -z $DISPLAY ]]; then
  VV=`/bin/echo $VERSION|cut -d. -f-2`
  case $VV in
    2.6)
	if spell_installed qt-x11;then
	  CFGTYPE=xconfig
	else
	  if spell_installed gtk+2; then
	    CFGTYPE=gconfig
	  fi
	fi
  	;;
    2.4)
        if spell_installed tk;then
          CFGTYPE=xconfig
        fi
	;;
  esac
fi



while
  case  $CONFIG_KERNEL in
    y|Y)  run_make  $CFGTYPE || run_make menuconfig
          if  query  "Repeat $CFGTYPE?  "  n
          then  CONFIG_KERNEL=y
          else  CONFIG_KERNEL=n
          fi     ;;
      *)  false  ;;
  esac
do
  true
done


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
    sparc*)  run_make  vmlinux ||  exit  1 ;;
       ppc)  run_make  vmlinux ||  exit  1 ;;
        sh)  run_make   zImage ||  exit  1 ;;
         *)  run_make  bzImage ||  exit  1 ;;
  esac

  # Only install modules if module support is wanted
  if  grep  -q "CONFIG_MODULES=y"  .config;  then
    run_make   modules       &&
    backup_modules           &&
    prepare_install                      &&
    run_make   modules_install  ||  exit  1;
  else
    prepare_install         ||  exit  1;
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
