( 

  case  $VIA4X  in
    y|Y|j|J)  cp   os-registry.c  os-registry.c.old
              sed  "s/NVreg_EnableVia4x = 0/NVreg_EnableVia4x = 1/"  \
              <    os-registry.c.old  >  os-registry.c
              ;;
  esac

  if  spell_installed  linux;  then
    VERSION=`installed_version  linux`
    cp   Makefile  Makefile.old
    sed  "s/\$(shell uname -r)/$VERSION/"  Makefile.old  >  Makefile
  fi

  sedit  "s/: gcc-check/:/"  Makefile

  prepare_install              
  make  IGNORE_CC_MISMATCH=1  install

) > $C_FIFO 2>&1
