cd  /usr/src/linux

make mrproper

while  
  case  $CONFIG_KERNEL in
    y|Y)  make  menuconfig
          if  query  "Repeat menuconfig?  "  n
          then  CONFIG_KERNEL=y
          else  CONFIG_KERNEL=n
          fi     ;;
      *)  false  ;;
  esac
do
  true
done


backup_modules()  {

  if    [  -d  /lib/modules/$VERSION-$EXTRAVERSION ];  then
    rm   -rf   /lib/modules/$VERSION-$EXTRAVERSION.old
    mv         /lib/modules/$VERSION-$EXTRAVERSION      \
               /lib/modules/$VERSION-$EXTRAVERSION.old
  fi

}


(

  yes  n  |  make  oldconfig
  cp  .config  $CONFIG_CACHE/kernel.config
  make  dep                 &&
  make  bzImage             &&

  # Only install modules if module support is wanted
  if  grep  -q "CONFIG_MODULES=y"  .config;  then
    make   modules          &&
    backup_modules          ||  exit  1;
  fi  &&
  
  prepare_install         &&
  
  if  grep  -q "CONFIG_MODULES=y"  .config;  then
    make   modules_install  ||  exit  1;
  fi  &&

  case  $BUILD  in
    powerpc-linux-gnu)  cp                 vmlinuz  /boot/vmlinubz-$VERSION  ;;
                    *)  cp  arch/i386/boot/bzImage  /boot/vmlinubz-$VERSION  ;;
  esac

) > $C_FIFO 2>&1
