( 

  case  $VIA4X  in
    y|Y|j|J)  cp   os-registry.c  os-registry.c.old
              sed  "s/NVreg_EnableVia4x = 0/NVreg_EnableVia4x = 1/"  \
              <    os-registry.c.old  >  os-registry.c
              ;;
  esac

  # A surprising number of module makefiles attempt to figure out the kernel
  # version in every way but the correct one - which is to check the kernel
  # makefile
       KVERSION=` head -1 /usr/src/linux/Makefile |           sed 's/.*=//'`
    KPATCHLEVEL=` head -2 /usr/src/linux/Makefile | tail -1 | sed 's/.*=//'`
      KSUBLEVEL=` head -3 /usr/src/linux/Makefile | tail -1 | sed 's/.*=//'`
  KEXTRAVERSION=` head -4 /usr/src/linux/Makefile | tail -1 | sed 's/.*=//'`

  KERNEL=`echo "${KVERSION}.${KPATCHLEVEL}.${KSUBLEVEL}${KEXTRAVERSION}" |
          sed 's/ //g'`
  
  sedit  "s/\$(shell uname -r)/$KERNEL/"  Makefile

  sedit  "s/: gcc-check/:/"  Makefile

  prepare_install              
  make  IGNORE_CC_MISMATCH=1  install

) > $C_FIFO 2>&1
