cd  /usr/src/linux

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

  if    [  -d  /lib/modules/$VERSION      ];  then
    rm   -rf   /lib/modules/$VERSION.old
    mv         /lib/modules/$VERSION      \
               /lib/modules/$VERSION.old
  fi

}


(

  yes  n  |  make  oldconfig
  cp  .config  $CONFIG_CACHE/kernel.config
  make  dep               &&
  make  bzImage           &&

  # Only install modules if module support is wanted
  if  grep  -q "CONFIG_MODULES=y"  .config;  then
    make   modules          &&
    backup_modules          &&
    prepare_install         &&
    make   modules_install  ||  exit  1;
  else
    prepare_install         ||  exit  1;
  fi

  case  $BUILD  in
    powerpc-linux-gnu)  cp                 vmlinux  /boot/vmlinubz-$VERSION  ;;
                    *)  cp  arch/i386/boot/bzImage  /boot/vmlinubz-$VERSION  ;;
  esac

) > $C_FIFO 2>&1
